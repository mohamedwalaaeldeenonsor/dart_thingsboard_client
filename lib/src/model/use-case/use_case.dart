class UseCase {
  final int id;
  final String useCaseEn;
  final String useCaseAr;

  UseCase({
    required this.id,
    required this.useCaseEn,
    required this.useCaseAr,
  });

  factory UseCase.fromJson(Map<String, dynamic> json) {
    return UseCase(
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
