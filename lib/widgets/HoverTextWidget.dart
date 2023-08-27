import 'package:flutter/material.dart';

class HoverTextWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color hoverColor;
  final Widget divider;
  final VoidCallback onTap; // Add this callback

  const HoverTextWidget({
    required this.text,
    required this.textStyle,
    required this.hoverColor,
    required this.divider,
    required this.onTap, // Pass the callback
  });

  @override
  _HoverTextWidgetState createState() => _HoverTextWidgetState();
}

class _HoverTextWidgetState extends State<HoverTextWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap, // Use the provided callback
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                widget.text,
                style: widget.textStyle.copyWith(
                  color: _isHovered ? widget.hoverColor : widget.textStyle.color,
                ),
              ),
              widget.divider,
            ],
          ),
        ),
      ),
    );
  }
}
