import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_api/models/local_photo_model.dart';
import 'package:unsplash_api/models/photo_model.dart';
import 'package:unsplash_api/services/photos/i_photos_service.dart';

class ListPhotosController extends GetxController {
  final IPhotosService _iPhotosService;
  ImagePicker? _picker;

  ListPhotosController(this._iPhotosService) {
    _picker = ImagePicker();
  }

  final _listRemotePhotosObs = <PhotoModel>[].obs;
  List<PhotoModel> get listRemotePhotos => _listRemotePhotosObs.toList();

  final _listLocalPhotosObs = <LocalPhotoModel>[].obs;
  List<LocalPhotoModel> get listLocalPhotos => _listLocalPhotosObs.toList();

  final List<XFile> _selectedPhotos = [];
  int count = 0;
  late Directory? tempDir;

  @override
  void onInit() async {
    tempDir = await getTemporaryDirectory();
    //await getPhotos();
    super.onInit();
  }

  Future choosePhotos() async {
    _selectedPhotos.clear();

    await _picker!.pickMultiImage().then((value) {
      if (value != null) _selectedPhotos.addAll(value.toList());
    });

    for (var xfile in _selectedPhotos) {
      int? tamanho;
      await xfile.length().then((value) => tamanho = value);
      log('Tamanho foto antes: ' + tamanho.toString());

      //Os valores minimos de altura e largura da compressao
      //poderiam ser definidos de acordo com a dimensao original da imagem
      var photo = await compressPhoto(
          photoPath: xfile.path, minWidth: 640, minHeight: 640, quality: 70);

      var thumb = await compressPhoto(
          photoPath: xfile.path, minWidth: 640, minHeight: 640, quality: 70);

      var decodedPhoto = await decodeImageFromList(photo!);
      var decodedThumb = await decodeImageFromList(thumb!);

      var photoSize = photo.lengthInBytes;
      var thumbSize = thumb.lengthInBytes;

      _listLocalPhotosObs.add(LocalPhotoModel(photo, thumb, decodedPhoto.width,
          decodedPhoto.height, decodedThumb.width, decodedThumb.height));

      log('Tamanho foto depois: ' + photoSize.toString() + ' bytes');
      log('Largura foto: ' + decodedPhoto.width.toString());
      log('Altura foto: ' + decodedPhoto.height.toString());

      log('Tamanho thumb depois: ' + thumbSize.toString() + ' bytes');
      log('Largura thumb: ' + decodedThumb.width.toString());
      log('Altura thumb: ' + decodedThumb.height.toString());

      log('---------------');
    }
  }

  Future<Uint8List?> compressPhoto({
    int quality = 50,
    int minWidth = 1280,
    int minHeight = 720,
    required String photoPath,
  }) async {
    final result = await FlutterImageCompress.compressWithFile(photoPath,
        minHeight: minHeight, minWidth: minWidth, quality: quality);

    return result;
  }

  Future getPhotos() async {
    await _iPhotosService
        .getListPhotos()
        .then((value) => _listRemotePhotosObs.addAll(value));
  }
}
