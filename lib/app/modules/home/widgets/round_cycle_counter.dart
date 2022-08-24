import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../helpers/text_style_helper.dart';
import '../home_store.dart';

class RoundCycleCounter extends StatefulWidget {
  final String title;
  final String current;
  final String total;
  const RoundCycleCounter(
      {Key? key,
      required this.title,
      required this.current,
      required this.total})
      : super(key: key);

  @override
  State<RoundCycleCounter> createState() => _RoundCycleCounterState();
}

class _RoundCycleCounterState extends State<RoundCycleCounter> {
  HomeStore homeStore = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyleHelper.roundAndCycleText(context),
        ),
        Text(
          '${widget.current}/${widget.total}',
          style: TextStyleHelper.roundAndCycleText(context),
        )
      ],
    );
  }
}
