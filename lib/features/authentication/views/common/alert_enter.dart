import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/sizes.dart';

class AlertEnter extends StatelessWidget {
  final String title;
  const AlertEnter({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return Container(
      width: realSize.width,
      height: realSize.height * 0.15,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size20,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
