import 'package:DevQuiz/challenge/controller/challenge_controller.dart';
import 'package:DevQuiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widget/question_indicator/question_indicator.dart';
import 'package:DevQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    @required this.questions,
    @required this.title
  });

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page.toInt();
    });
    super.initState();
  }

  void onChange() {
    if((controller.currentPage+1) < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 100),
          curve: Curves.linear
      );
  }

  void onSelected(bool value){
    if(value){
      controller.hits++;
    }
    onChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) =>
                      QuestionIndicatorWidget(
                      currentPage: value + 1,
                      lenght: widget.questions.length,
                    )
              ),
            ],
          )
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
        .map(
          (e) => QuizWidget(
              question: e,
              onSelected: (value) {
                Future.delayed(const Duration(seconds: 1))
                    .then((_) => onSelected(value));
              })
        )
        .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) =>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if((value+1) < widget.questions.length)
                    Expanded(child: NextButtonWidget.white(
                      label: 'Pular',
                      onTap: (){onChange();}
                  )),
                  if((value+1) == widget.questions.length)
                    Expanded(child: NextButtonWidget.green(
                    label: 'Terminar',
                    onTap: (){
                      Navigator.of(context)
                          .pushReplacement(
                            MaterialPageRoute(builder: (_) => ResultPage(
                              title: widget.title,
                              lenght: widget.questions.length,
                              result: controller.hits,
                            ))
                          );
                    },
                  ))
                ],
              ),
          ),
        )
      ),
    );
  }
}
