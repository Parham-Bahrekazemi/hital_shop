import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.icon,
    this.textInputType,
    this.controller,
    this.validator,
    this.visible,
  });

  final String hintText;

  final IconData? icon;

  final TextInputType? textInputType;

  final TextEditingController? controller;

  final String? Function(String?)? validator;

  final bool? visible;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.visible ?? false,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.textInputType == TextInputType.visiblePassword
          ? obscureText
          : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        filled: true,
        fillColor:
            widget.visible == true ? const Color(0xffEFEFEF) : Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.visible == true
                ? Theme.of(context).dividerColor
                : Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            if (widget.textInputType == TextInputType.visiblePassword) {
              setState(() {
                obscureText = !obscureText;
              });
            }
          },
          child: Icon(
            widget.textInputType == TextInputType.visiblePassword
                ? (obscureText ? Iconsax.eye_slash : Iconsax.eye)
                : widget.icon,
            size: 23,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
