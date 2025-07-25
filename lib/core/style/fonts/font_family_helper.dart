class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String Arabic = 'Cairo';
  static const String English = 'Poppins';
  static  String language = 'English'; // Default language
  static String getLanguage() {
    // Returns the appropriate font family based on the provided language
    switch (language) {
      case 'Arabic':
        return 'Arabic';
      case 'English':
        return 'English';
      default:
        return 'English'; // Default to English if no match
    }
  }
}
