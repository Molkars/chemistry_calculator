const Map<int, String> kSuperscriptText = {
  0: "⁰",
  1: "¹",
  2: "²",
  3: "³",
  4: "⁴",
  5: "⁵",
  6: "⁶",
  7: "⁷",
  8: "⁸",
  9: "⁹"
};

String parseElectronConfig(String electronConfig) {
  print(electronConfig.replaceAll(" (predicted)", ""));
  List<String> chars = electronConfig.split("");
  print(chars);

  for (int i = 0; i < chars.length; i++) {
    String character = chars[i];

    if (i == chars.length - 1) {
      chars.last = kSuperscriptText[int.tryParse(character)];
    } else if (_isNumber(character) &&
        (chars[i + 1] == " " || _isNumber(chars[i + 1])) &&
        !_isNumber(chars[i - 1])) {
      chars[i] = kSuperscriptText[int.parse(character)];
    }
  }

  return chars.join("");
}

bool _isNumber(String char) => int.tryParse(char) != null;