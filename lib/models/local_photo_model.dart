import 'dart:io';

import 'dart:typed_data';

class LocalPhotoModel {
  Uint8List? photo;
  Uint8List? thumb;
  int? photoWidth;
  int? photoHeight;
  int? thumbWidth;
  int? thumbHeight;

  LocalPhotoModel(this.photo, this.thumb, this.photoWidth, this.photoHeight,
      this.thumbWidth, this.thumbHeight);
}
