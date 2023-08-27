import 'package:flutter/material.dart';
import 'package:nnntech/Const/consts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterElement extends StatelessWidget {


   List<Widget> a =[
    Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PURE ENGINEERING LLC',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'RAKIA Industrial Zone, Warehouse WIZ 08/11',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            'PO Box – 86013, Ras Al Khaimah – UAE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'TEL - +971(7) 2433135',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            'MOBILE - +971-559502083',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            'Email – brajesh@pureeng.ae',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            'www.pureeng.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: 40),
    Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HEAD OFFICE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Pure Engineering LLC, Ras Al Khaimah.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            '(Steel Structural Fabrications & Conventional - Machine Shop)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'BRANCH OFFICE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Pure Engineering LLC, Dubai Investment Park 2, Dubai.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            '(CNC - Machine Shop)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: 40),
    Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT US',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'PURE ENGINEERING LLC is located in RAKIA Industrial Zone, in the emirates of Ras Al Khaimah, UAE. The company is ISO certificated & specialized in producing precision engineering components made on CNC lathe & milling centers, & ensuring high repeatability & accuracy of the same, to fulfill the customer requirements, the company has its own dedicated team with the latest software in 2D & 3D CAD helps in making engineering drawing effortlessly while CAM gives an advantage in making complex parts rapidly and accurately.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: 40),
    Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ACCREDITATIONS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'ISO 9001:2015 - ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Quality Management System\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'ISO 14001:2015 - ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Environment Management System\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'ISO 45001:2018 - ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Occupational Health and Safety Management System',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          color: Consts.masterColor, // Adjust the background color as needed
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: sizingInformation.deviceScreenType == DeviceScreenType.desktop?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: a,
          ):Container()
        );
      }
    );
  }
}
