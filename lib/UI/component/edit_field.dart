import 'package:dazllapp/config/app_theme.dart';
import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? inputType;
  final int? maxLength;
  final bool isPassword;
  const EditField(
      {this.controller,
      this.hint,
      this.inputType,
      this.maxLength,
      this.isPassword = false,
      Key? key})
      : super(key: key);

  @override
  _EditFieldState createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  bool _showPassword = false;
  @override
  void initState() {
    if (widget.isPassword) {
      _showPassword = true;
    }
    super.initState();
  }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      // inputFormatters:<TextInputFormatter>[formater],
      obscureText: _showPassword,
      cursorColor: AppTheme.nearlyBlack,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: new TextStyle(
              color: AppTheme.darkerText,
              fontFamily: AppTheme.fontName,
              fontSize: 15,
              fontWeight: FontWeight.w400),
          labelStyle: new TextStyle(
              color: const Color(0xFF424242),
              fontFamily: AppTheme.fontName,
              fontSize: 15),
          counter: Container(),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.red)),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    _togglevisibility();
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.red,
                  ),
                )
              : null),
    );
  }
}