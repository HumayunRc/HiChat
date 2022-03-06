import 'imports.dart';

abstract class AppColors {
  static const secondary = Color.fromARGB(255, 58, 143, 255);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color.fromARGB(255, 45, 48, 49);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const opchityFaded = Color.fromARGB(45, 123, 124, 134);
  static const iconLight = Color(0xFFE2D7D7);
  static const iconDark = Color.fromARGB(255, 105, 106, 114);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.questrialTextTheme()
            .apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: accentColor, brightness: Brightness.light),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.iconDark),
          centerTitle: true,
          titleTextStyle: GoogleFonts.questrial(
            color: AppColors.textDark,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.quicksandTextTheme()
            .apply(bodyColor: AppColors.textLigth),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: accentColor, brightness: Brightness.dark),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.iconLight),
          centerTitle: true,
          titleTextStyle: GoogleFonts.quicksand(
            color: AppColors.textLigth,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
