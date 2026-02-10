class CreatePasswordPayload {
  final String activateToken;
  final String password;

  const CreatePasswordPayload({
    required this.activateToken,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'activateToken': activateToken,
      'password': password,
    };
  }

  factory CreatePasswordPayload.fromJson(Map<String, dynamic> json) {
    return CreatePasswordPayload(
      activateToken: json['activateToken'] as String,
      password: json['password'] as String,
    );
  }
}
