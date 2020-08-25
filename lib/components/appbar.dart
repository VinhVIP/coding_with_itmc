import 'package:flutter/material.dart';

import '../config.dart';

PreferredSize buildAppbar(BuildContext context, {String title, Widget leading, List<Widget> actions}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: AppBar(
      backgroundColor: kPrimaryColor,
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: leading,
      actions: actions,
    ),
  );
}
