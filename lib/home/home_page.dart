import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.success){
      return Scaffold(
        appBar: AppBarWidget(user: controller.user,),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: LevelButtonWidget.FACIL,),
                  LevelButtonWidget(label: LevelButtonWidget.MEDIO,),
                  LevelButtonWidget(label: LevelButtonWidget.DIFICIL,),
                  LevelButtonWidget(label: LevelButtonWidget.PERITO,)
                ],
              ),
              SizedBox(height: 24,),
              Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    children: controller.quizzes
                      .map((e) => QuizCardWidget(
                          title: e.title,
                          completed: '${e.questionAwnsered} de ${e.questions.length}',
                          percent: e.questionAwnsered/e.questions.length,
                          onTap: () {
                            Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: e.questions,
                                      title: e.title,
                                    )
                                )
                              );
                          },
                      ))
                      .toList(),
                  )
              )
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
