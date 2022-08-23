import 'package:flutter/material.dart';

import '../../helpers/text_style_helper.dart';

class RoundCycleCounter extends StatefulWidget {
  final String title;
  const RoundCycleCounter({Key? key, required this.title}) : super(key: key);

  @override
  State<RoundCycleCounter> createState() => _RoundCycleCounterState();
}

class _RoundCycleCounterState extends State<RoundCycleCounter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyleHelper.roundAndCycleText(context),
        ),
        Text(
          '1/6',
          style: TextStyleHelper.roundAndCycleText(context),
        )
      ],
    );
  }
}
