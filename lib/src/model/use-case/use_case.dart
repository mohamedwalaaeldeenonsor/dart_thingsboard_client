class DemoUseCase {
  final int id;
  final String useCaseEn;
  final String useCaseAr;

  DemoUseCase({
    required this.id,
    required this.useCaseEn,
    required this.useCaseAr,
  });

  factory DemoUseCase.fromJson(Map<String, dynamic> json) {
    return DemoUseCase(
      id: json['id'],
      useCaseEn: json['useCaseEn'],
      useCaseAr: json['useCaseAr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'useCaseEn': useCaseEn,
      'useCaseAr': useCaseAr,
    };
  }
}
