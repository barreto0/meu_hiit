import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_bottom_sheet.dart';
import 'package:meu_hiit/app/modules/commom_widgets/meu_hiit_button.dart';
import 'package:meu_hiit/app/modules/helpers/screen_helper.dart';
import 'package:meu_hiit/app/modules/helpers/text_style_helper.dart';
import 'package:meu_hiit/app/modules/home/widgets/configure_exercise/configure_exercise_item.dart';

class ConfigureExercise extends StatelessWidget {
  const ConfigureExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MeuHiitBottomSheet().getBottomSheet(
          context: context,
          content: Padding(
            padding: EdgeInsets.all(
              ScreenHelper.screenHeightPercentage(context, 2.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConfigureExerciseItem(
                    label: 'Exercício',
                    count: '00:30',
                    add: () {},
                    subtract: () {}),
                ConfigureExerciseItem(
                    label: 'Descanso',
                    count: '00:30',
                    add: () {},
                    subtract: () {}),
                ConfigureExerciseItem(
                    label: 'Rounds', count: '6', add: () {}, subtract: () {}),
                ConfigureExerciseItem(
                    label: 'Ciclos', count: '6', add: () {}, subtract: () {}),
                SizedBox(
                  height: ScreenHelper.screenHeightPercentage(context, 2),
                ),
                MeuHiitButton(
                  width: ScreenHelper.screenWidth(context),
                  onPressed: () {},
                  label: 'Salvar',
                  color: '#79FF6D',
                )
              ],
            ),
          ),
        );
      },
      child: Text(
        'Configurar exercício',
        style: TextStyleHelper.configureExercise(context),
      ),
    );
  }
}
