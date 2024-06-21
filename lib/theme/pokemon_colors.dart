import 'dart:ui';

class PokemonColors {
  static const Color grassColor = Color(0xFF78D1B6);
  static const Color fireColor = Color(0xFFFC9D9A);
  static const Color waterColor = Color(0xFFA3CCE9);
  static const Color electricColor = Color(0xFFFFE3A0);
  static const Color normalColor = Color(0xFFC3B59F);
  static const Color fightingColor = Color(0xFFD46763);
  static const Color flyingColor = Color(0xFFBDA9F4);
  static const Color poisonColor = Color(0xFFC98FBF);
  static const Color groundColor = Color(0xFFF0D2A4);
  static const Color rockColor = Color(0xFFCDB79E);
  static const Color bugColor = Color(0xFFB1C479);
  static const Color ghostColor = Color(0xFF9689BA);
  static const Color steelColor = Color(0xFFB8B8D0);
  static const Color psychicColor = Color(0xFFF8A5C2);
  static const Color iceColor = Color(0xFFBCE6E6);
  static const Color dragonColor = Color(0xFFA890F0);
  static const Color darkColor = Color(0xFFA29288);
  static const Color fairyColor = Color(0xFFEE99AC);
  static const Color unknownColor = Color(0xFF797979);

  static Color getPokemonTypeColor(String type) {
    switch (type.toLowerCase()) {
      case "grass":
        return grassColor;
      case "fire":
        return fireColor;
      case "water":
        return waterColor;
      case "electric":
        return electricColor;
      case "normal":
        return normalColor;
      case "fighting":
        return fightingColor;
      case "flying":
        return flyingColor;
      case "poison":
        return poisonColor;
      case "ground":
        return groundColor;
      case "rock":
        return rockColor;
      case "bug":
        return bugColor;
      case "ghost":
        return ghostColor;
      case "steel":
        return steelColor;
      case "psychic":
        return psychicColor;
      case "ice":
        return iceColor;
      case "dragon":
        return dragonColor;
      case "dark":
        return darkColor;
      case "fairy":
        return fairyColor;
      default:
        return unknownColor;
    }
  }
}
