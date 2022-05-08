import 'package:flutter/material.dart';

class TapOutsideToUnfocus extends StatelessWidget {
  final Widget child;
  final VoidCallback? resetFocus;

  const TapOutsideToUnfocus({Key? key, required this.child, this.resetFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();

        resetFocus?.call();
      },
      child: child,
    );
  }
}
