import 'package:equatable/equatable.dart';

class SpritesModel extends Equatable {
  final OtherSpritesModel other;

  const SpritesModel({
    required this.other,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      other: OtherSpritesModel.fromJson(json['other'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    other,
  ];
}

class OtherSpritesModel extends Equatable {
  final OfficialArtworkSpritesModel officialArtwork;

  const OtherSpritesModel({
    required this.officialArtwork,
  });

  factory OtherSpritesModel.fromJson(Map<String, dynamic> json) {
    return OtherSpritesModel(
      officialArtwork: OfficialArtworkSpritesModel.fromJson(json['official-artwork'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    officialArtwork,
  ];
}

class OfficialArtworkSpritesModel extends Equatable {
  final String frontDefault;

  const OfficialArtworkSpritesModel({
    required this.frontDefault,
  });

  factory OfficialArtworkSpritesModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkSpritesModel(
      frontDefault: json['front_default'] as String,
    );
  }

  @override
  List<Object?> get props => [
    frontDefault,
  ];
}