class DemoRequestPayload {
  final String name;
  final String phoneNumber;
  final String email;
  final String companyName;
  final String message;
  final String useCase;

  DemoRequestPayload({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.companyName,
    required this.message,
    required this.useCase,
  });

  factory DemoRequestPayload.fromJson(Map<String, dynamic> json) {
    return DemoRequestPayload(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      companyName: json['companyName'] as String,
      message: json['message'] as String,
      useCase: json['useCase'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'companyName': companyName,
      'message': message,
      'useCase': useCase,
    };
  }
}
