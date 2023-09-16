import 'package:flutter/material.dart';

class CustomPasswordFiled extends StatefulWidget {
  const CustomPasswordFiled({super.key, required this.hintText, this.onChanged});
  final String hintText;
  final Function(String)? onChanged;

  @override
  State<CustomPasswordFiled> createState() => _CustomPasswordFiledState();
}

class _CustomPasswordFiledState extends State<CustomPasswordFiled> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'filed is required';
        } else {
          return null;
        }
      },
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.password),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
