extension StringExtension on String {
  String capitalizeFirstChar() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String word() {
    if (length == 2) {
      return toUpperCase();
    }
    var input = replaceAll("-", " ");

    return input.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return word;
    }).join(' ');
  }
}