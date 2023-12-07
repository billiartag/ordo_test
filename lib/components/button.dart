import 'package:flutter/material.dart';
import 'package:ordo_test/const/colors.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  const ArrowButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 19,
        width: 19,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: OrdoColors.lightPurple50Color,
        ),
        child: const Icon(
          Icons.keyboard_arrow_right,
          size: 18,
          color: OrdoColors.darkPurpleColor,
        ),
      ),
    );
  }
}
