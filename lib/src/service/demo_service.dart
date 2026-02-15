import 'dart:convert';
import 'dart:developer';

import 'package:thingsboard_client/thingsboard_client.dart';

class DemoService {
  final ThingsboardClient _tbClient;

  factory DemoService(ThingsboardClient tbClient) {
    return DemoService._internal(tbClient);
  }

  DemoService._internal(this._tbClient);

  Future<DemoRequestResponse> requestDemo(DemoRequestPayload demoRequestPayload,
      {String? accessToken, RequestConfig? requestConfig}) async {
    var response = await _tbClient.post<Map<String, dynamic>>(
        '/api/demo/request',
        data: jsonEncode(demoRequestPayload),
        options: defaultHttpOptionsFromConfig(requestConfig));

    if (response.statusCode != 200) {
      print(response.data);
      throw Exception('Failed to request demo: ${response.statusCode}');
    }
    return DemoRequestResponse.fromJson(response.data!);
  }

  Future<List<DemoUseCase>> getUseCases() async {
    var response = await _tbClient.get<Map<String, dynamic>>(
      '/api/noauth/demo/usecases',
    );

    if (response.statusCode != 200) {
      print(response.data);
      throw Exception('Failed to request demo: ${response.statusCode}');
    }
    log(response.data.toString());
    return (response.data as List)
        .map((useCase) => DemoUseCase.fromJson(useCase as Map<String, dynamic>))
        .toList();
  }
}
