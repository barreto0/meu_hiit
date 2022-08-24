import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/helpers/color_helper.dart';

import '../../../helpers/screen_helper.dart';
import '../../../helpers/text_style_helper.dart';

class ConfigureExerciseItem extends StatelessWidget {
  final String label;
  final String count;
  final Function() add;
  final Function() subtract;
  const ConfigureExerciseItem(
      {Key? key,
      required this.label,
      required this.add,
      required this.subtract,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenHelper.screenHeightPercentage(context, 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyleHelper.configureExerciseItemText(context),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: subtract,
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: ScreenHelper.screenHeightPercentage(context, 3.7),
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidthPercentage(context, 1.5),
                  ),
                  Text(
                    count,
                    style: TextStyleHelper.configureExerciseItemText(context),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidthPercentage(context, 1.5),
                  ),
                  GestureDetector(
                    onTap: add,
                    child: Icon(
                      Icons.add_circle_outline,
                      size: ScreenHelper.screenHeightPercentage(context, 3.7),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: ScreenHelper.screenHeightPercentage(context, 1),
          ),
          const Divider(
            height: 1,
            thickness: 0.3,
            endIndent: 0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
