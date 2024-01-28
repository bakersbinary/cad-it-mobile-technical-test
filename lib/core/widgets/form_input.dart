import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? textEditingController;

  const FormInput({
    super.key,
    required this.title,
    this.obscureText = false,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: double.infinity,
          height: 48.0,
          child: TextFormField(
            obscureText: obscureText,
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
