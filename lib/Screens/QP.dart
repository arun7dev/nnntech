import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Const/consts.dart';

class QP extends StatelessWidget {
  const QP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'QUALITY POLICY',
          style: GoogleFonts.abel(
              fontSize: 3.sw,
              color: Consts.masterColor
                  .withOpacity(0.5)),
        ),
        Text('''
• Employing only the finest raw materials sourced from esteemed manufacturers and suppliers, we engage in the meticulous fabrication of products. Our vigilant quality control department meticulously examines each stage of production, ensuring that only products of supreme quality make their way to the market.
• Our production processes are guided by comprehensive Test Plans and Flow Charts that meticulously outline the controls necessary to achieve the required level of Product Quality, along with the essential documentary requirements and individual personnel responsibilities.
• Instilled within our core philosophy, a deep-rooted commitment to quality has been our compass. We devote ourselves to collaborating with our clients and partners, placing a spotlight on the quality imperatives of their businesses and consistently fulfilling their distinct needs.
• Fostering a unified dedication to quality throughout our service spectrum remains paramount.
• We remain unswerving in establishing vigilant controls that continuously monitor and meet the diverse expectations of our clients and partners.
• With an unwavering commitment to enhancement, we consistently assess our Quality Performance and the efficiency of our Quality System, driving a constant pursuit of improvement. This commitment is etched in our ongoing journey to meet and exceed expectations.
    '''),
      ],
    );
  }
}
