import 'package:flutter/material.dart';
import 'package:hearted_map/theme/sh_theme.dart';

class InputBar extends StatelessWidget {
  final String? prompt;
  final String label;
  final TextEditingController controller;

  final bool? isobscureText;
  const InputBar({
    super.key,
    required this.label,
    required this.controller,
    this.prompt,
    this.isobscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(label),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: TextFormField(
              controller: controller,
              obscureText: isobscureText!,
              decoration: InputDecoration(
                hintText: prompt,
                hintStyle: TextSize_16_G,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
