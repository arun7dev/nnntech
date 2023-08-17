import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nnntech/widgets/Heading.dart';
import 'package:nnntech/widgets/Services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

import '../Const/consts.dart';
import '../widgets/Experienced.dart';
import '../widgets/HoverCard.dart';

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

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getValueForScreenType<double>(
              context: context,
              mobile: 10,
              tablet: 30,
              desktop: 60,
            )),
            child: Column(
              children: [
                // Padding(
                //   padding:  EdgeInsets.only(top: 10.screenWidth, left: 30.screenWidth,right: 30.sw),
                //   child: Center(
                //     child: _controller.value.isInitialized
                //         ? AspectRatio(
                //       aspectRatio: _controller.value.aspectRatio,
                //       child: VideoPlayer(_controller),
                //     )
                //         : const CircularProgressIndicator(),
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(1.sw),
                        // Adding padding around the image
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10.sw), // Adding rounded border
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.sw),
                          // Same border radius as container
                          child: Image.asset(
                            'assets/AU.jpg',
                            fit: BoxFit
                                .cover, // Fit the image inside the container
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(1.sw),
                        // Adding padding around the column
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10.sw), // Adding rounded border
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Us",
                              style: TextStyle(
                                  fontSize: 3.sw, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Heading(text: "YOU DESIGN IT, WE MAKE IT"),
                            // Adding space between title and text
                            Text(
                              "Established in 1995, Saftech is a best-in-class engineering goods manufacturer in UAE. Combining 25 "
                              "years of experience, unrivaled engineering knowhow, and attention-to-detail in one place, we produce high-quality goods "
                              "in our state-of-the-art facility per your unique needs. At Saftech, we’ve cultivated highly-skilled engineers who tap into "
                              "their problem-solving skills to complete your projects with precision. From machining, fabrication, and forging to presswork and 3D printing, "
                              "we’ve got you covered with our wide array of time-tested solutions.",
                              style: TextStyle(fontSize: 2.sw),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Heading(text: 'Our Success Journey'),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.1), // Set the desired background color
                    borderRadius:
                        BorderRadius.circular(10), // Add rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExperienceWidget(
                        title: '27+',
                        subtitle: ' Years of Experience',
                      ),
                      ExperienceWidget(
                        title: '21K',
                        subtitle: 'Jobs Done',
                      ),
                      ExperienceWidget(
                        title: '100+',
                        subtitle: 'Satisfied Customers',
                      ),
                    ],
                  ),
                ),
                Heading(text: 'Our Services'),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.1), // Set the desired background color
                    borderRadius:
                        BorderRadius.circular(10), // Add rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServicesWidget(
                        imageAsset:
                            'assets/services/Precision-Machining-1-1.png',
                        subtitle: 'Precision Machining',
                      ),
                      ServicesWidget(
                        imageAsset: 'assets/services/Fabrication-1.png',
                        subtitle: 'Fabrication        ',
                      ),
                      ServicesWidget(
                        imageAsset:
                            'assets/services/Anchor-Bolt-Manufacturing-1.png',
                        subtitle: 'Anchor Bolts       ',
                      ),
                      ServicesWidget(
                        imageAsset: 'assets/services/Pressed-Work-1.png',
                        subtitle: 'Pressed Work       ',
                      ),
                      ServicesWidget(
                        imageAsset: 'assets/services/Milling-Cutters.png',
                        subtitle: 'Trading            ',
                      ),
                    ],
                  ),
                ),

                Heading(text: 'Why Choose Us'),

                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.1), // Set the desired background color
                    borderRadius:
                        BorderRadius.circular(10), // Add rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HoverCard(
                        title: 'Experienced Team',
                        subtitle: 'Our team has over 25 years of experience. ',
                        icon: Icons.person,
                      ),
                      HoverCard(
                        title: 'Latest Technologies',
                        subtitle:
                            'We keep up with the latest technologies. We are always on the cutting edge',
                        icon: Icons.settings,
                      ),
                      HoverCard(
                        title: 'Family Business',
                        subtitle:
                            'We are a family-owned business. We care about our customers',
                        icon: Icons.family_restroom,
                      ),
                      HoverCard(
                        title: 'Precise & On Time',
                        subtitle:
                            'We Manufacture with precision and on time. We are always on time',
                        icon: Icons.person,
                      ),
                      HoverCard(
                        title: 'Competitive Pricing',
                        subtitle:
                            'Our prices are competitive. We offer the best value for your money',
                        icon: Icons.currency_bitcoin,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.sw),
                  child: Text(
                    'Ready to experience the difference our manufacturing solutions can make?',
                    style: GoogleFonts.robotoSlab(
                      fontSize:3.sw,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                Heading(text: 'Projects that we have contributed to'),

                CarouselSlider(
                  items: Consts.imageUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true, // Auto-play the carousel
                    enlargeCenterPage: true, // Zoom in on the center image
                    aspectRatio: 1,
                    height: 50.sw,
                    autoPlayInterval: Duration(milliseconds: 2000),
                  ),
                ),
                Heading(text: 'We Represent'),
                CarouselSlider(
                  items: Consts.pngCompanyUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width / Consts.pngCompanyUrls.length, // Calculate the width
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    //enlargeCenterPage: true,
                    aspectRatio: 1,
                    height: 20.sw,
                   // autoPlayInterval: Duration(milliseconds: 2000),
                    viewportFraction: 1.0 / Consts.pngCompanyUrls.length, // Set the fraction of the viewport for each item
                  ),
                ),

              ],
            ),
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
