import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final void Function(String)? onChanged ;
  final String text ;
  final bool obscureText ;

  const TextFormWidget({
    super.key,required this.text,required this.onChanged,  this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      // keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) return "Enter value";
      },
      obscureText: obscureText,
      decoration:  InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}