class DemoRequestResponse {
  final String message;
  final String email;
  final bool success;
  final String activationLink;

  DemoRequestResponse({
    required this.message,
    required this.email,
    required this.success,
    required this.activationLink,
  });

  factory DemoRequestResponse.fromJson(Map<String, dynamic> json) {
    return DemoRequestResponse(
      message: json['message'],
      email: json['email'],
      success: json['success'],
      activationLink: json['activationLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'email': email,
      'success': success,
      'activationLink': activationLink,
    };
  }
}
