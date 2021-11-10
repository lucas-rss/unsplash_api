import 'package:unsplash_api/models/photo_model.dart';
import 'package:unsplash_api/services/i_request_provider.dart';
import 'package:unsplash_api/services/photos/i_photos_service.dart';
import 'package:unsplash_api/utils/constants.dart';

class PhotosService implements IPhotosService {
  final IRequestProvider _iRequestProvider;

  PhotosService(this._iRequestProvider);

  @override
  Future<List<PhotoModel>> getListPhotos() async {
    String url = Constants.baseUrl + 'photos';

    var response = await _iRequestProvider.getAsync(url);

    List<PhotoModel> listPhotos = [];

    response.data.forEach((map) => listPhotos.add(PhotoModel.fromMap(map)));

    return listPhotos;
  }
}
