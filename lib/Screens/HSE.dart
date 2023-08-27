import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Const/consts.dart';

class HSE extends StatelessWidget {
  const HSE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HSE POLICY',
      style: GoogleFonts.abel(
          fontWeight: FontWeight.bold,
          fontSize: 4.sw,
          color: Consts.masterColor.withOpacity(0.7)),
        ),
        Text(
          '''
• Our unwavering dedication lies in cultivating a work environment that's not just productive, but also safe and healthy for everyone.
• We are resolute in our pursuit of achieving zero lost time incidents, which includes preventing work-related illnesses. To ensure this, our workforce undergoes continual training, keeping them aligned with this objective.
• Safety, both for our personnel and the systems they operate within, remains a cornerstone of our values.
• We hold the preservation of the environment and the creation of clean, harmonious surroundings in the highest regard.
• The framework for our Health, Safety, and Environment (HSE) management is meticulously documented in our Health and Safety manual, which strictly adheres to ISO 14001 and OHSAS 18001 standards.
• Every member of our team is guided by the principles outlined in the manual, ensuring its principles are upheld throughout all stages of their activities.''',
        ),
      ],
    );
  }
}