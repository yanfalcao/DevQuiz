import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;

  QuestionIndicatorWidget({
    @required this.currentPage,
    @required this.lenght
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão ${currentPage}',
                style: AppTextStyles.body,
              ),
              Text('de ${lenght}',
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(height: 20,),
          ProgressIndicatorWidget(value: currentPage / lenght)
        ],
      ),
    );
  }
}
