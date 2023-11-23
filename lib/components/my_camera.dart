import 'package:flutter/material.dart';

class MyCamera extends StatelessWidget {
  final void Function()? onTap;

  const MyCamera({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(
          Icons.camera_alt_rounded,
          size: 60,
          ),
      ),
    );
  }
}
