import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/extensions/hex_color.dart';
import '../../helpers/text_style_helper.dart';

class StartButton extends StatefulWidget {
  final double width;
  final Function() onPressed;
  final String label;
  const StartButton({
    Key? key,
    required this.width,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: HexColor.fromHex('#79FF6D'),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        child: Text(
          widget.label,
          style: TextStyleHelper.buttonLabel(context),
        ),
      ),
    );
  }
}
