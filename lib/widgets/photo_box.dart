import 'dart:typed_data';
import 'package:flutter/material.dart';

class PhotoBox extends StatelessWidget {
  final Uint8List photo;

  const PhotoBox({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 4.0,
                      spreadRadius: 0),
                ],
                image: DecorationImage(
                    image: MemoryImage(photo), fit: BoxFit.cover))));
  }
}
