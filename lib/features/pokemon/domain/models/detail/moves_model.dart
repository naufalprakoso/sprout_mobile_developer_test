import 'package:equatable/equatable.dart';

class MovesModel extends Equatable {
  final MoveModel move;

  const MovesModel({
    required this.move,
  });

  factory MovesModel.fromJson(Map<String, dynamic> json) {
    return MovesModel(
      move: MoveModel.fromJson(json['move'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    move,
  ];
}

class MoveModel extends Equatable {
  final String name;

  const MoveModel({
    required this.name,
  });

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
    name,
  ];
}
