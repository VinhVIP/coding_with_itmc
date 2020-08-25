import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  final bool hide;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Icon icon, suffixIcon;

  RoundedTextField(
      {Key key,
        this.hintText,
        this.hide,
        this.onChanged,
        this.controller,
        this.icon,
        this.suffixIcon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RoundedTextField(key, hintText, hide, onChanged, controller, icon, suffixIcon);
  }
}

class _RoundedTextField extends State<RoundedTextField> {
  bool hide;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  final Icon icon, suffixIcon;

  _RoundedTextField(Key key, this.hintText, this.hide, this.onChanged, this.controller,
      this.icon, this.suffixIcon);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: hide == null ? false : hide,
        cursorColor: Colors.white,
        maxLines: 1,
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: icon,
//          suffixIcon: IconButton(
//            color: Colors.white,
//            icon: Icon(hide == null
//                ? null
//                : (hide ? Icons.visibility_off : Icons.visibility)),
//            onPressed: () {
//              setState(() {
//                if (hide != null) {
//                  hide = !hide;
//                }
//              });
//            },
//          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}