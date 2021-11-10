import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoExhibitionPage extends StatelessWidget {
  final Uint8List photo;

  const PhotoExhibitionPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: MemoryImage(photo),
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
