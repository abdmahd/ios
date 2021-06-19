import 'package:final_project/Artisan/core/view_model/auth_view_model_Artisan.dart';

import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';

import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(
      () => AuthViewModel(),
    );
    Get.lazyPut<AuthViewModelArtisan>(
      () => AuthViewModelArtisan(),
    );
    Get.lazyPut<FireStoreUsers>(
      () => FireStoreUsers(),
    );
  }
}
