

import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsersServiceModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

List<ArtisanModel> get artisanModel => _artisanModel;
List<ArtisanModel> _artisanModel =[];


 

  UsersServiceModel() {
   getArtisan();
  }

 getArtisan() async {
    _loading.value = true;
    UsersServiceModel().getArtisan().then((value) {
      for (int i = 0; i < value.length; i++) {
        _artisanModel.add(ArtisanModel.fromJson(value[i].data()));
        print(_artisanModel.length);
        _loading.value = false;
      }
     
      update();
    });
  }

  
}
