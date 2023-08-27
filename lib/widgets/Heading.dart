import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nnntech/Const/consts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Heading extends StatelessWidget {
  final String text;

  Heading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(  vertical: 2.sw),
      child: Text(
        text,
        style: GoogleFonts.robotoSlab(
          fontSize: 5.sw,
          fontWeight: FontWeight.bold,
          color: Consts.masterColor,
        ),
      ),
    );
  }
}