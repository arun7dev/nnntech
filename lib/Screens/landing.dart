import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:nnntech/Screens/ContactUsForn.dart';
import 'package:nnntech/widgets/Heading.dart';
import 'package:nnntech/widgets/Services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../Const/consts.dart';
import '../widgets/Experienced.dart';
import '../widgets/HoverCard.dart';
import '../widgets/HoverTextWidget.dart';
import '../widgets/IconTextSubtitle.dart';
import 'FooterElement.dart';
import 'HSE.dart';
import 'QP.dart';
import 'gallery.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/dam.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMapURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'pure@pureeng.ae',
    );
    String  url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await  launchUrl(Uri.parse(url));
    } else {
      print( 'Could not launch $url');
    }
  }


  List<String> combinedImageList = [
    ...Consts.machiningImage,
    ...Consts.fabricationsImage
  ];

  AutoScrollController _scrollController = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 10.sw,
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Consts.masterColor,
          title: Row(
            children: [
              Image.asset('assets/logo.png', width: 15.sw),
              if (sizingInformation.screenSize.width > 1600)
                Row(
                  children: [
                    IconTextSubtitleWidget(
                      isSubtitleBold: true,
                        onTap: () {
                          _launchMapsUrl(25.6654954876655, 55.80036962392935);
                        },
                        icon: Icons.location_on_outlined,
                        title: "Ras Al Khaimah – UAE",
                        subtitle: "Dubai Investment Park 2 – UAE"),
                    SizedBox(width: 5.sw,),
                  ],
                ),
              if (sizingInformation.screenSize.width > 1600)
                Row(
                  children: [
                    IconTextSubtitleWidget(
                      isSubtitleBold: false,
                        onTap: () {},
                        icon: Icons.watch_later_outlined,
                        title: "Monday - Saturday - 8 AM - 6 PM",
                        subtitle: "Sunday Closed"),
                    SizedBox(width: 5.sw,),
                  ],
                ),
              if (sizingInformation.screenSize.width > 1600)
                IconTextSubtitleWidget(
                    isSubtitleBold: false,
                    onTap: () async {

                      _launchMapURL();
                    },
                    icon: Icons.mail_outline,
                    title: "TEL - +971(7) 2433135",
                    subtitle: "brajesh@pureeng.ae"),
            ],
          ),
          actions: [
            for (String item in Consts.drawerItems)
              HoverTextWidget(
                onTap: () {
                  if (item == Consts.drawerItems[0]) {
                    _scrollController.scrollToIndex(1,
                        preferPosition: AutoScrollPosition.begin);
                  } else if (item == Consts.drawerItems[1]) {
                    _scrollController.scrollToIndex(2,
                        preferPosition: AutoScrollPosition.begin);
                  } else if (item == Consts.drawerItems[2]) {
                    _scrollController.scrollToIndex(3,
                        preferPosition: AutoScrollPosition.begin);
                  } else if (item == Consts.drawerItems[3]) {
                    _scrollController.scrollToIndex(4,
                        preferPosition: AutoScrollPosition.begin);
                  } else if (item == Consts.drawerItems[4]) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Gallery(combinedImageList: combinedImageList)));
                  }
                },
                text: item,
                textStyle: GoogleFonts.abel(
                  fontSize: 3.sw,
                  fontWeight: FontWeight.bold,
                ),
                hoverColor: Consts.masterColor,
                divider: const Text('/'),
              ),
          ],
          bottom: sizingInformation.screenSize.width > 1600
              ? null
              : AppBar(
                  surfaceTintColor: Consts.masterColor,
                  centerTitle: true,
                  title: Row(
                    children: [
                      const Spacer(),
                      IconTextSubtitleWidget(
                        isSubtitleBold: true,
                          onTap: () {
                            _launchMapsUrl(25.6654954876655, 55.80036962392935);
                          },
                          icon: Icons.location_on_outlined,
                          title: "Ras Al Khaimah – UAE",
                          subtitle: "Dubai Investment Park 2 – UAE"),
                      IconTextSubtitleWidget(
                        isSubtitleBold: false,
                          onTap: () {},
                          icon: Icons.watch_later_outlined,
                          title: "Monday - Saturday - 8 AM - 6 PM",
                          subtitle: "Sunday Closed"),
                      IconTextSubtitleWidget(
                          isSubtitleBold: false,
                          onTap: () async {

                            _launchMapURL();
                          },
                          icon: Icons.mail_outline,
                          title:
                              "TEL - +971(7) 2433135",
                          subtitle: "brajesh@pureeng.ae"),
                      const Spacer(),
                    ],
                  )),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(getValueForScreenType<double>(
                  context: context,
                  mobile: 10,
                  tablet: 30,
                  desktop: 60,
                )),
                child: Column(
                  children: [
                    AutoScrollTag(
                      key: ValueKey(1),
                      controller: _scrollController,
                      index: 1, // Use the corresponding index
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.sw),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.3),
                                    // Adjust opacity to control brightness
                                    BlendMode.lighten,
                                  ),
                                  child: Image.asset(
                                    'assets/cover.jpg',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.sw),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    // Semi-transparent black background
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Mechanical Solutions Specialist',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10.sw, // Adjust the font size
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.white, // Adjust the text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AutoScrollTag(
                      key: ValueKey(2),
                      controller: _scrollController,
                      index: 2, // Use the corresponding index
                      child: Column(
                        children: [
                          Heading(text: Consts.drawerItems[1]),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getValueForScreenType<double>(
                              context: context,
                              mobile: 10,
                              tablet: 30,
                              desktop: 100,
                            )),
                            child: Column(
                              children: [
                                Text(
                                  '''PURE ENGINEERING LLC is situated in the thriving RAKIA Industrial Zone, within the emirate of Ras Al Khaimah, UAE. With ISO certification under our belt, our expertise lies in crafting precision engineering components on advanced CNC lathe and milling centers. These cutting-edge processes ensure remarkable consistency and accuracy, meeting the diverse needs of our customers.

Our dedicated team, armed with the latest 2D and 3D CAD software, effortlessly creates engineering drawings. The utilization of CAM technology further empowers us to swiftly and precisely manufacture intricate components.

In addition to our sophisticated CNC operations, we offer a full-fledged Conventional Machining facility. This facility caters to various applications, including turning, milling, boring, grinding, and cutting, providing a comprehensive suite of solutions.

Our accomplished human resource pool comprises technically adept production teams, skilled planners, CAD/CAM engineers, CNC operators, fabricators, and welders. This rich blend of expertise equips us to serve diverse industries, ranging from Oil & Gas, Cement, and Ceramic to Cable, Glass, Sugar, and General Engineering.

At the heart of our operation is an unwavering commitment to quality and punctual delivery. Our foremost goal is to ensure the satisfaction of our customers by consistently delivering top-notch products on time.''',
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/2.jpeg', height: 12.sw),
                                    SizedBox(width: 10.sw),
                                    Image.asset('assets/1.jpeg', height: 12.sw),
                                    SizedBox(width: 10.sw),
                                    Image.asset('assets/3.jpeg', height: 12.sw),
                                  ],
                                ),
                                Heading(text: 'Our Policies'),
                                // sizingInformation.deviceScreenType ==
                                //         DeviceScreenType.desktop
                                //     ? Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Expanded(child: HSE()),
                                //           Expanded(child: QP())
                                //         ],
                                //       )
                                //     : Column(
                                //         children: [HSE(), QP()],
                                //       )
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [ QP(),HSE()],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoScrollTag(
                      key: ValueKey(3),
                      controller: _scrollController,
                      index: 3, // Use the corresponding index
                      child: Column(
                        children: [
                          Heading(text: Consts.drawerItems[2]),
                          Column(
                            children: [
                              Text(
                                'Fabrications',
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 4.sw,
                                    color: Consts.masterColor.withOpacity(0.7)),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CarouselSlider(
                                      items: Consts.fabricationsImage.map((url) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: double.infinity,
                                              // Set the width to match the container
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),

                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2.sw),
                                                child: Image.asset(
                                                  url,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                          autoPlay: true,
                                          enlargeCenterPage: true,
                                          aspectRatio: 16 / 9,
                                          // Adjust the aspect ratio as needed
                                          height: 20.sw,
                                          autoPlayInterval:
                                              Duration(milliseconds: 2000),
                                          viewportFraction:
                                              0.3 // Set viewportFraction to 1.0 for full width
                                          ),
                                    ),
                                  ),
                                  sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop
                                      ? Expanded(child: Text('''
We pride ourselves on our comprehensive and dedicated custom metal fabrication and design division. Guided by a seasoned team, we harness the power of cutting-edge machinery and advanced facilities. Our journey began as a fabrication unit, evolving into a specialized force for diverse projects. Our fabrication standards stand shoulder to shoulder with the finest in the industry.

Fabrication forms the bedrock of numerous sectors, particularly within the dynamic oil and gas industry. We're instrumental in crafting components for a wide spectrum of applications, including wellheads, refineries, intricate pipe networks, process units, and resilient structures.
                                  
                                  ''')):Container(),
                                ],
                              ),
                              Text(
                                'Precision Machining',
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 4.sw,
                                    color: Consts.masterColor.withOpacity(0.7)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'CNC TURNING-',
                                    style: GoogleFonts.abel(
                                        fontSize: 3.sw,
                                        color: Consts.masterColor.withOpacity(0.5)),
                                  ),
                                  Text(
                                    'CNC MILLING-',
                                    style: GoogleFonts.abel(
                                        fontSize: 3.sw,
                                        color: Consts.masterColor.withOpacity(0.5)),
                                  ),
                                  Text(
                                    'MULTI AXIS MACHINNG',
                                    style: GoogleFonts.abel(
                                        fontSize: 3.sw,
                                        color: Consts.masterColor.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop
                                      ?Expanded(child: Text('''
At the heart of our operations, we excel in Precision Machining and Fabrications. Through CNC Turning, CNC Milling, and Multi-Axis Machining, we craft precise components. Our Fabrications division shapes raw materials into functional works of art. We collaborate with clients to turn ideas into reality, creating wellheads, refineries, pipe networks, and process units. Our modern facilities and skilled workforce drive innovation in the oil and gas industry. Quality, safety, and environmental responsibility guide our practices, setting new standards for excellence.
                                  ''')):Container(),
                                  Expanded(
                                    flex: 3,
                                    child: CarouselSlider(
                                      items: Consts.machiningImage.map((url) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: double.infinity,
                                              // Set the width to match the container
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),

                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2.sw),
                                                child: Image.asset(
                                                  url,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                          autoPlay: true,
                                          //enlargeCenterPage: true,
                                          aspectRatio: 16 / 9,
                                          // Adjust the aspect ratio as needed
                                          height: 20.sw,
                                          autoPlayInterval:
                                              Duration(milliseconds: 2000),
                                          viewportFraction:
                                              0.2 // Set viewportFraction to 1.0 for full width
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AutoScrollTag(
                      key: ValueKey(4),
                      controller: _scrollController,
                      index: 4, // Use the corresponding index
                      child: Column(
                        children: [
                          Heading(text: Consts.drawerItems[3]),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getValueForScreenType<double>(
                              context: context,
                              mobile: 10,
                              tablet: 30,
                              desktop: 100,
                            )),
                            child: ContactUsForm(),
                          ),
                        ],
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         padding: EdgeInsets.all(1.sw),
                    //         // Adding padding around the image
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(
                    //               10.sw), // Adding rounded border
                    //         ),
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(2.sw),
                    //           // Same border radius as container
                    //           child: Image.asset(
                    //             'assets/AU.jpg',
                    //             fit: BoxFit
                    //                 .cover, // Fit the image inside the container
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         padding: EdgeInsets.all(1.sw),
                    //         // Adding padding around the column
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(
                    //               10.sw), // Adding rounded border
                    //         ),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "About Us",
                    //               style: TextStyle(
                    //                   fontSize: 3.sw, fontWeight: FontWeight.bold),
                    //             ),
                    //             SizedBox(height: 10),
                    //             Heading(text: "YOU DESIGN IT, WE MAKE IT"),
                    //             // Adding space between title and text
                    //             Text(
                    //               "Established in 1995, Saftech is a best-in-class engineering goods manufacturer in UAE. Combining 25 "
                    //               "years of experience, unrivaled engineering knowhow, and attention-to-detail in one place, we produce high-quality goods "
                    //               "in our state-of-the-art facility per your unique needs. At Saftech, we’ve cultivated highly-skilled engineers who tap into "
                    //               "their problem-solving skills to complete your projects with precision. From machining, fabrication, and forging to presswork and 3D printing, "
                    //               "we’ve got you covered with our wide array of time-tested solutions.",
                    //               style: TextStyle(fontSize: 2.sw),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Heading(text: 'Our Success Journey'),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context)
                    //         .primaryColorDark
                    //         .withOpacity(0.1), // Set the desired background color
                    //     borderRadius:
                    //         BorderRadius.circular(10), // Add rounded corners
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       ExperienceWidget(
                    //         title: '27+',
                    //         subtitle: ' Years of Experience',
                    //       ),
                    //       ExperienceWidget(
                    //         title: '21K',
                    //         subtitle: 'Jobs Done',
                    //       ),
                    //       ExperienceWidget(
                    //         title: '100+',
                    //         subtitle: 'Satisfied Customers',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Heading(text: 'Our Services'),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context)
                    //         .primaryColorDark
                    //         .withOpacity(0.1), // Set the desired background color
                    //     borderRadius:
                    //         BorderRadius.circular(10), // Add rounded corners
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       ServicesWidget(
                    //         imageAsset:
                    //             'assets/services/Precision-Machining-1-1.png',
                    //         subtitle: 'Precision Machining',
                    //       ),
                    //       ServicesWidget(
                    //         imageAsset: 'assets/services/Fabrication-1.png',
                    //         subtitle: 'Fabrication        ',
                    //       ),
                    //       ServicesWidget(
                    //         imageAsset:
                    //             'assets/services/Anchor-Bolt-Manufacturing-1.png',
                    //         subtitle: 'Anchor Bolts       ',
                    //       ),
                    //       ServicesWidget(
                    //         imageAsset: 'assets/services/Pressed-Work-1.png',
                    //         subtitle: 'Pressed Work       ',
                    //       ),
                    //       ServicesWidget(
                    //         imageAsset: 'assets/services/Milling-Cutters.png',
                    //         subtitle: 'Trading            ',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Heading(text: 'Why Choose Us'),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context)
                    //         .primaryColorDark
                    //         .withOpacity(0.1), // Set the desired background color
                    //     borderRadius:
                    //         BorderRadius.circular(10), // Add rounded corners
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       HoverCard(
                    //         title: 'Experienced Team',
                    //         subtitle: 'Our team has over 25 years of experience. ',
                    //         icon: Icons.person,
                    //       ),
                    //       HoverCard(
                    //         title: 'Latest Technologies',
                    //         subtitle:
                    //             'We keep up with the latest technologies. We are always on the cutting edge',
                    //         icon: Icons.settings,
                    //       ),
                    //       HoverCard(
                    //         title: 'Family Business',
                    //         subtitle:
                    //             'We are a family-owned business. We care about our customers',
                    //         icon: Icons.family_restroom,
                    //       ),
                    //       HoverCard(
                    //         title: 'Precise & On Time',
                    //         subtitle:
                    //             'We Manufacture with precision and on time. We are always on time',
                    //         icon: Icons.person,
                    //       ),
                    //       HoverCard(
                    //         title: 'Competitive Pricing',
                    //         subtitle:
                    //             'Our prices are competitive. We offer the best value for your money',
                    //         icon: Icons.currency_bitcoin,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 2.sw),
                    //   child: Text(
                    //     'Ready to experience the difference our manufacturing solutions can make?',
                    //     style: GoogleFonts.robotoSlab(
                    //       fontSize: 3.sw,
                    //       fontWeight: FontWeight.w300,
                    //       color: Theme.of(context).primaryColor,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    // Heading(text: 'Projects that we have contributed to'),
                    // CarouselSlider(
                    //   items: Consts.imageUrls.map((url) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey,
                    //           ),
                    //           child: Image.network(
                    //             url,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    //   options: CarouselOptions(
                    //     autoPlay: true,
                    //     // Auto-play the carousel
                    //     enlargeCenterPage: true,
                    //     // Zoom in on the center image
                    //     aspectRatio: 1,
                    //     height: 50.sw,
                    //     autoPlayInterval: Duration(milliseconds: 2000),
                    //   ),
                    // ),
                    // Heading(text: 'We Represent'),
                    // CarouselSlider(
                    //   items: Consts.pngCompanyUrls.map((url) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width /
                    //               Consts.pngCompanyUrls.length,
                    //           // Calculate the width
                    //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey,
                    //           ),
                    //           child: Image.network(
                    //             url,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    //   options: CarouselOptions(
                    //     autoPlay: true,
                    //     //enlargeCenterPage: true,
                    //     aspectRatio: 1,
                    //     height: 20.sw,
                    //     // autoPlayInterval: Duration(milliseconds: 2000),
                    //     viewportFraction: 1.0 /
                    //         Consts.pngCompanyUrls
                    //             .length, // Set the fraction of the viewport for each item
                    //   ),
                    // ),
                  ],
                ),
              ),
              FooterElement(),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
