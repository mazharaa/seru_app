import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final int minLines;
  final TextEditingController? controller;

  const InputTextField({
    super.key,
    required this.label,
    this.minLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        label: Text(label),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      minLines: minLines,
      maxLines: minLines,
    );
  }
}
