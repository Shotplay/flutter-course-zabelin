import 'package:flutter/material.dart';

extension BrandColorsContext on BuildContext {
  BrandColors get brandColors => Theme.of(this).extension<BrandColors>()!;
}

@immutable
class BrandColors extends ThemeExtension<BrandColors> {
  final Color primary;
  final Color background;
  final Color textDark;
  final Color textGrey;
  final Color textRed;
  final Color border;
  final Color errorBorder;
  final Color errorBackground;
  final Color borderSelected;
  final Color appBarBackgroundColor;
  final Color cardBackgroundColor;

  const BrandColors({
    required this.primary,
    required this.background,
    required this.textDark,
    required this.textGrey,
    required this.textRed,
    required this.border,
    required this.errorBorder,
    required this.errorBackground,
    required this.borderSelected,
    required this.appBarBackgroundColor,
    required this.cardBackgroundColor,
  });

  @override
  ThemeExtension<BrandColors> copyWith({
    Color? primary,
    Color? background,
    Color? textDark,
    Color? textGrey,
    Color? textRed,
    Color? border,
    Color? errorBorder,
    Color? errorBackground,
    Color? borderSelected,
    Color? appBarBackgroundColor,
    Color? cardBackgroundColor,
  }) {
    return BrandColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      textDark: textDark ?? this.textDark,
      textGrey: textGrey ?? this.textGrey,
      textRed: textRed ?? this.textRed,
      border: border ?? this.border,
      errorBorder: errorBorder ?? this.errorBorder,
      errorBackground: errorBackground ?? this.errorBackground,
      borderSelected: borderSelected ?? this.borderSelected,
      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
    );
  }

  @override
  BrandColors lerp(ThemeExtension<BrandColors>? other, double t) {
    if (other is! BrandColors) return this;

    return BrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      textDark: Color.lerp(textDark, other.textDark, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      textRed: Color.lerp(textRed, other.textRed, t)!,
      border: Color.lerp(border, other.border, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      errorBackground: Color.lerp(errorBackground, other.errorBackground, t)!,
      borderSelected: Color.lerp(borderSelected, other.borderSelected, t)!,
      appBarBackgroundColor: Color.lerp(
        appBarBackgroundColor,
        other.appBarBackgroundColor,
        t,
      )!,
      cardBackgroundColor: Color.lerp(
        cardBackgroundColor,
        other.cardBackgroundColor,
        t,
      )!,
    );
  }
}
