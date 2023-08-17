import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HoverCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  HoverCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  Padding(
        padding: EdgeInsets.all(1.sw),
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isHovered ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              padding: EdgeInsets.all(1.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 300),
                    crossFadeState: isHovered
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Column(
                      children: [
                        Icon(widget.icon,size: 5.sw,),
                        SizedBox(width: 8),
                        Text(
                          widget.title,
                          style: TextStyle(
                           // fontWeight: FontWeight.bold,
                            fontSize: 2.sw,
                          ),
                          textAlign:  TextAlign.center,
                        ),
                      ],
                    ),
              secondChild: Container(
                width: double.infinity,
                padding: EdgeInsets.all(1.sw),
                child: Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 2.sw,
                    //color: Colors.grey,
                  ),
                  maxLines: 5, // Allow up to 5 lines
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
