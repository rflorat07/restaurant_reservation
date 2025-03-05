import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TCustomTextFormField extends StatelessWidget {
  const TCustomTextFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.validator,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
  });

  final String label;
  final bool obscureText;
  final InputDecoration? decoration;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
        ),

        const SizedBox(height: TSizes.size6),

        TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          decoration: decoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
