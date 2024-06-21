import 'package:equatable/equatable.dart';

class AbilitiesModel extends Equatable {
  final bool isHidden;
  final AbilityModel ability;

  const AbilitiesModel({
    required this.isHidden,
    required this.ability,
  });

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) {
    return AbilitiesModel(
      isHidden: json['is_hidden'] as bool,
      ability: AbilityModel.fromJson(json['ability'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    isHidden,
    ability,
  ];
}

class AbilityModel extends Equatable {
  final String name;

  const AbilityModel({
    required this.name,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}
