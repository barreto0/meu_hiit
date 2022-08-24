import 'package:flutter/material.dart';

class MeuHiitBottomSheet {
  Future getBottomSheet(
      {required BuildContext context,
      required Widget content,
      bool hideHeader = false,
      bool isDismissible = true}) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return content;
      },
    );
  }
}
