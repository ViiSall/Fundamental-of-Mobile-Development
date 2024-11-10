import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4_s3/bird.jpg",
  "assets/w4_s3/bird2.jpg",
  "assets/w4_s3/insect.jpg",
  "assets/w4_s3/girl.jpg",
  "assets/w4_s3/man.jpg",
];

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ImageViewer(),
));

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0;

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}
