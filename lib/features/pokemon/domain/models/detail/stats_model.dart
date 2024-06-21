import 'package:equatable/equatable.dart';

class StatsModel extends Equatable {
  final int baseStat;
  final int effort;
  final StatModel stat;

  const StatsModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      baseStat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: StatModel.fromJson(json['stat'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    baseStat,
    effort,
    stat,
  ];
}

class StatModel extends Equatable {
  final String name;

  const StatModel({
    required this.name,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}
