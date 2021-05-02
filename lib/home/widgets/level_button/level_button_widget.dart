import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  static final String FACIL = 'Fácil';
  static final String MEDIO = 'Médio';
  static final String DIFICIL = 'Difícil';
  static final String PERITO = 'Perito';

  static final String _COLOR = 'color';
  static final String _BORDER_COLOR = 'borderColor';
  static final String _FONT_COLOR = 'fontColor';

  final String label;

  LevelButtonWidget({
    @required this.label
  }) : assert([FACIL, MEDIO, DIFICIL, PERITO].contains(label));

  final config = {
    FACIL: {
      _COLOR: AppColors.levelButtonFacil,
      _BORDER_COLOR: AppColors.levelButtonBorderFacil,
      _FONT_COLOR: AppColors.levelButtonTextFacil
    },
    MEDIO: {
      _COLOR: AppColors.levelButtonMedio,
      _BORDER_COLOR: AppColors.levelButtonBorderMedio,
      _FONT_COLOR: AppColors.levelButtonTextMedio
    },
    DIFICIL: {
      _COLOR: AppColors.levelButtonDificil,
      _BORDER_COLOR: AppColors.levelButtonBorderDificil,
      _FONT_COLOR: AppColors.levelButtonTextDificil
    },
    PERITO: {
      _COLOR: AppColors.levelButtonPerito,
      _BORDER_COLOR: AppColors.levelButtonBorderPerito,
      _FONT_COLOR: AppColors.levelButtonTextPerito
    }
  };

  Color get color => config[label][_COLOR];

  Color get borderColor => config[label][_BORDER_COLOR];

  Color get fontColor => config[label][_FONT_COLOR];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(label,
          style: GoogleFonts.notoSans(
              color: fontColor,
              fontSize: 13
          ),
        ),
      ),
    );
  }
}
