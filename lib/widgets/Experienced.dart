import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperienceWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  ExperienceWidget({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 5.sw,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 2.sw,
            ),
          ),
        ],
      ),
    );
  }
}
