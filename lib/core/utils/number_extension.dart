extension NumberExtension on int {
  String convertToHeight() {
     final number = this / 10.0;
     return "${number.toStringAsFixed(2)} cm";
  }

  String convertToWeight() {
    double weightInKg = this / 10.0;
    return "${weightInKg.toStringAsFixed(1)} kg";
  }
}