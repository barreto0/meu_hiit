import 'package:flutter/material.dart';
import 'package:meu_hiit/app/modules/extensions/hex_color.dart';
import '../helpers/text_style_helper.dart';

class MeuHiitButton extends StatefulWidget {
  final double width;
  final Function() onPressed;
  final String label;
  final String color;
  const MeuHiitButton({
    Key? key,
    required this.width,
    required this.onPressed,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  State<MeuHiitButton> createState() => _MeuHiitButtonState();
}

class _MeuHiitButtonState extends State<MeuHiitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: HexColor.fromHex(widget.color),
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
