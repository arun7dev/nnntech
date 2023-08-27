import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Const/consts.dart';


class IconTextSubtitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap; // Add this callback
  const IconTextSubtitleWidget({
    super.key, required this.icon, required this.title, required this.subtitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,color: Consts.masterColor,size: 5.sw,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 1.5.sw,fontWeight: FontWeight.bold),),
                Text(subtitle,style: TextStyle(fontSize: 1.5.sw),),
              ]
          )
        ],
      ),
    );
  }
}
