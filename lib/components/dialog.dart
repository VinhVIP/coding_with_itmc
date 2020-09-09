import 'package:coding_with_itmc/models/notification.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class MyDialog{

  bool isShowingDialogLoading = false;
  bool isShowingDialogNotify = false;

  showDialogLoading(BuildContext context, String title) {
    isShowingDialogLoading = true;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: darkMode ? kBackgroundDarkColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.indigo, fontSize: 22),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    ).then((value) {
      print("Close dialog loading");
      isShowingDialogLoading = false;
    });
  }

  showDialogNotification(BuildContext context, String title, Notify notify, {Function press}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: darkMode ? kBackgroundDarkColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.indigo, fontSize: 22),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                notify.message,
                style: TextStyle(color: darkMode ? kTextDarkColor : kTextColor),
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                onPressed: press ?? () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    ).then((value){
      if(value.toString().compareTo('back') == 0){
        Navigator.of(context).pop('VinhVIP');
      }
    });
  }
}
