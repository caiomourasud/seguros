class Converters {
  simplifyString(String string) {
    return string
        .toLowerCase()
        .replaceAll('á', 'a')
        .replaceAll('é', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ú', 'u')
        .replaceAll('â', 'a')
        .replaceAll('ê', 'e')
        .replaceAll('î', 'i')
        .replaceAll('ô', 'o')
        .replaceAll('ã', 'a')
        .replaceAll('õ', 'o')
        .replaceAll('à', 'a')
        .replaceAll('ü', 'u')
        .replaceAll('ñ', 'n')
        .replaceAll('ç', 'c');
  }
}
