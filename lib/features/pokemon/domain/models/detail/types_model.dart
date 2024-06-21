import 'package:equatable/equatable.dart';

class TypesModel extends Equatable {
  final TypeModel type;

  const TypesModel({
    required this.type,
  });

  factory TypesModel.fromJson(Map<String, dynamic> json) {
    return TypesModel(
      type: TypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    type,
  ];
}

class TypeModel extends Equatable {
  final String name;

  const TypeModel({
    required this.name,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}
