class UrlsModel {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  UrlsModel({this.raw, this.full, this.regular, this.small, this.thumb});

  static UrlsModel fromMap(Map<String, dynamic> map) => UrlsModel(
      raw: map['raw'],
      full: map['full'],
      regular: map['regular'],
      small: map['small'],
      thumb: map['thumb']);
}
