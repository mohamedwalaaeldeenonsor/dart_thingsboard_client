import 'dart:convert';

import 'package:thingsboard_client/thingsboard_client.dart';

class NoAuthService {
  final ThingsboardClient _tbClient;

  factory NoAuthService(ThingsboardClient tbClient) {
    return NoAuthService._internal(tbClient);
  }

  NoAuthService._internal(this._tbClient);

  Future<void> requestDemo(CreatePasswordPayload createPasswordPayload,
      {bool? sendActivationMail, RequestConfig? requestConfig}) async {
    var response = await _tbClient.post<Map<String, dynamic>>(
        '/api/noauth/activate?sendActivationMail=${sendActivationMail ?? true}',
        data: jsonEncode(createPasswordPayload),
        options: defaultHttpOptionsFromConfig(requestConfig));

    if (response.statusCode != 200) {
      print(response.data);
      throw Exception('Failed to request demo: ${response.statusCode}');
    }
  }
}
