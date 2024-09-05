import 'package:flutter/material.dart';

// New LocationCard widget
class Categorycard extends StatelessWidget {
  final String text;
  final double fontSize;

  const Categorycard({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Flexible(
        child: Text(
          text,
          maxLines: 2,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
