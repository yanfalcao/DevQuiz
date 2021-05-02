import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  AwnserWidget({
    @required this.awnser,
    @required this.onTap,
    this.isSelected = false,
    this.disabled = false
  });

  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: (){
            this.onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                    BorderSide(color: isSelected ? _selectedBorderCardRight : AppColors.border)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(awnser.title,
                    style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                  )
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(150),
                    border: Border.fromBorderSide(
                        BorderSide(color: isSelected ? _selectedBorderRight : AppColors.border)
                    )
                  ),
                  child: isSelected ?
                  Icon(
                    _selectedIconRight,
                    size: 16,
                    color: AppColors.white,
                  )
                  : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
