import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../helpers/color_helper.dart';
import '../helpers/screen_helper.dart';

class MeuHiitAppbar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool hasGoBack;
  List<Widget>? actions;

  MeuHiitAppbar(
      {Key? key, required this.title, required this.hasGoBack, this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: ColorHelper.lightGray(),
        centerTitle: true,
        toolbarHeight: kToolbarHeight,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenHelper.screenWidthPercentage(context, 5),
          ),
        ),
        leading: hasGoBack
            ? Padding(
                padding: const EdgeInsets.only(left: 3),
                child: IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: ScreenHelper.screenWidthPercentage(context, 7),
                  ),
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        actions: actions ?? []);
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
