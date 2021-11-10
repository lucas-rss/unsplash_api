import 'package:unsplash_api/models/urls_model.dart';

class PhotoModel {
  String? id;
  UrlsModel? urls;

  PhotoModel({this.id, this.urls});

  static PhotoModel fromMap(Map<String, dynamic> map) =>
      PhotoModel(id: map['id'], urls: UrlsModel.fromMap(map['urls']));
}
