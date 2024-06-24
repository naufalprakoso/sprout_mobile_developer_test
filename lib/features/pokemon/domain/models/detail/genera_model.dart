import 'package:equatable/equatable.dart';

class GeneraModel extends Equatable {
  final String genus;
  final GeneraLanguageModel language;

  const GeneraModel({
    required this.genus,
    required this.language,
  });

  factory GeneraModel.fromJson(Map<String, dynamic> json) {
    return GeneraModel(
      genus: json['genus'] as String,
      language: GeneraLanguageModel.fromJson(json['language'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    genus,
    language,
  ];
}

class GeneraLanguageModel extends Equatable {
  final String name;

  const GeneraLanguageModel({
    required this.name,
  });

  factory GeneraLanguageModel.fromJson(Map<String, dynamic> json) {
    return GeneraLanguageModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}
