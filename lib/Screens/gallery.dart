import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Const/consts.dart';
import '../widgets/Heading.dart';

class Gallery extends StatefulWidget {
  final List<String> combinedImageList;

  const Gallery({
    required this.combinedImageList,
  });

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay to show the loader for demonstration purposes
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Heading(text: Consts.drawerItems[4]),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,

                spacing: 5.0, // Adjust the spacing between images
                runSpacing: 5.0, // Adjust the spacing between rows
                children: List.generate(
                  widget.combinedImageList.length,
                      (index) => Container(
                    width: 300, // Adjust the width as needed
                    height: 300, // Adjust the height as needed
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.sw),
                      child: _isLoading
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : Image.asset(
                        widget.combinedImageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
