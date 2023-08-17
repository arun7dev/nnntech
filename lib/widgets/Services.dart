import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesWidget extends StatefulWidget {
  final String imageAsset;
  final String subtitle;

  ServicesWidget({required this.imageAsset, required this.subtitle});

  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
          child: InkWell(
            onTap: () {
              // Handle the tap event here
            },
            child: Container(
              padding: EdgeInsets.all(1.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isHovered
                      ? Colors.blue // Change border color when hovered
                      : Colors.grey,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    widget.imageAsset,
                    width: 5.sw,
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 2.sw,
                    ),
                    textAlign: TextAlign.center,
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
