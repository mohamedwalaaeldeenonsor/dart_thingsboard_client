import 'dart:convert';

import 'package:thingsboard_client/src/model/demo/demo_request_paylaod.dart';
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
        queryParameters: {'accessToken': accessToken},
        options: defaultHttpOptionsFromConfig(requestConfig));

    if (response.statusCode != 200) {
      print(response.data);
      throw Exception('Failed to request demo: ${response.statusCode}');
    }
    return DemoRequestResponse.fromJson(response.data!);
  }
}
