import 'package:dazllapp/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? initialValue;
  final int? minLine;
  final TextInputType? keyboardType;
  // final Widget? prefixicon;
  // final bool isPasswordField;
  final bool iscard;
  final bool? isReadOnly;
  // final bool isEuroSign;
  final Function? onchanged;
  const CustomTextField({
    // super.key,
    // this.prefixicon,
    required this.controller,
    this.keyboardType,
    this.minLine,
    this.initialValue,
    this.isReadOnly,
    required this.label,
    // this.isEuroSign = false,
    this.iscard = false,
    this.onchanged,
    // this.isPasswordField = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.minLine == null ? 50 : 100,
      child: TextFormField(
        initialValue: widget.initialValue, readOnly: widget.isReadOnly ?? false,
        controller: widget.controller,
        
        // obscureText: widget.isPasswordField && hidePassword,
        // obscuringCharacter: "*",
        onChanged: (value) {
          widget.onchanged != null ? widget.onchanged!() : null;
        },
        minLines: widget.minLine ?? null,
        maxLines: widget.minLine == null ? null : 10,
        keyboardType: widget.keyboardType??TextInputType.text,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(
            horizontal: 18,
            vertical: widget.minLine == null ? 0: 8,
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 40,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 40,
          ),

          // prefixIcon: widget.prefixicon != null
          //     ? SizedBox(
          //         width: 20,
          //         child: Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: widget.prefixicon,
          //         ),
          //       )
          //     : widget.isEuroSign
          //         ? SizedBox(
          //             width: 20,
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 20,
          //                 vertical: 10,
          //               ),
          //               child: Text(
          //                 "£",
          //                 style: Theme.of(context).textTheme.titleMedium,
          //               ),
          //             ),
          //           )
          //         : null,
          // suffixIcon: widget.isPasswordField
          //     ? Padding(
          //         padding: const EdgeInsets.only(right: 10.0),
          //         child: InkWell(
          //           borderRadius: BorderRadius.circular(80),
          //           onTap: () => setState(() {
          //             hidePassword = !hidePassword;
          //           }),
          //           child: SizedBox(
          //             width: 30,
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   vertical: 3.0, horizontal: 3),
          //               child: hidePassword
          //                   ? CustomIcon(
          //                       icon: CustomIcons.eyeClosed,
          //                       size: 20,
          //                     )
          //                   : CustomIcon(
          //                       icon: CustomIcons.eye,
          //                       size: 20,
          //                     ),
          //             ),
          //           ),
          //         ),
          //       )
          //     : widget.iscard
          //         ? Padding(
          //             padding: const EdgeInsets.only(right: 0.0),
          //             child: Image.asset(
          //               Images.cards,
          //             ),
          //           )
          //         : null,
          hintText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusColor: greyColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: darkTextColor, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: greyColor, width: 1.0),
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: BorderSide(color: Appcolor.outline, width: 1.0),
          // ),
        ),
      ),
    );
  }
}
