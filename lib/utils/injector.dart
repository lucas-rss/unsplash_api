import 'package:get_it/get_it.dart';
import 'package:unsplash_api/services/i_request_provider.dart';
import 'package:unsplash_api/services/photos/i_photos_service.dart';
import 'package:unsplash_api/services/photos/photos_service.dart';
import 'package:unsplash_api/services/request_provider.dart';

class Injector {
  static void setup() {
    GetIt getIt = GetIt.instance;
    
    getIt.registerFactory<IRequestProvider>(() => RequestProvider());
    getIt.registerFactory<IPhotosService>(() => PhotosService(getIt()));
  }
}
