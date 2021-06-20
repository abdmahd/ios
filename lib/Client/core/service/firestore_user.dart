import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/core/service/FirestoreService.dart';
import 'package:final_project/Client/model/Demande.dart';
import 'package:final_project/Client/model/Signal.dart';
import 'package:final_project/Client/model/apeel_model.dart';
import 'package:final_project/Client/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FireStoreUsers extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  static FireStoreUsers instance = Get.find();

  List<ArtisanModel> get artisanModel => _artisanModel;
  List<ArtisanModel> _artisanModel = [];

  List<UserModel> get userModel => _userModel;
  List<UserModel> _userModel = [];

  List<ApellModel> get apellModel => _apellModel;
  List<ApellModel> _apellModel = [];

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference _artisanCollectionRef =
      FirebaseFirestore.instance.collection('Artisans');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<void> addUserToFireStoreArtisan(ArtisanModel artisanModel) async {
    return await _artisanCollectionRef
        .doc(artisanModel.artisanId)
        .set(artisanModel.toJson());
  }

  final CollectionReference _appeloffert =
      FirebaseFirestore.instance.collection('Appel');

  Future<void> addAppeleToFireStore(ApellModel apellModel) async {
    return await _appeloffert.add(apellModel.toJson());
  }

  final CollectionReference _demande =
      FirebaseFirestore.instance.collection('Demande');

  Future<void> addDemandeToFireStore(Demande demandemodel) async {
    return await _demande.add(demandemodel.toJson());
  }

  final CollectionReference _signalmodel =
      FirebaseFirestore.instance.collection('SignalClient');

  Future<void> addSignalToFireStore(SignalModel signalmodel) async {
    return await _signalmodel.add(signalmodel.toJson());
  }

  FireStoreUsers() {
    getArtisan();
    getUsers();
    getAppel();
    getAppelByClient(box.read("user")['userId']);
  }

  getArtisan() async {
    _loading.value = true;

    FireStoreService().getArtisan().then((value) {
      for (int i = 0; i < value.length; i++) {
        _artisanModel.add(ArtisanModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  getUsers() async {
    _loading.value = true;
    FireStoreService().getUsers().then((value) {
      for (int i = 0; i < value.length; i++) {
        _userModel.add(UserModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  getAppel() async {
    _loading.value = true;
    FireStoreService().getAppels().then((value) {
      for (int i = 0; i < value.length; i++) {
        _apellModel.add(ApellModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  final box = GetStorage();
  final CollectionReference _appel =
      FirebaseFirestore.instance.collection('Appel');

  List<ApellModel> get apell => _apell;
  List<ApellModel> _apell = [];

  Future<List<QueryDocumentSnapshot>> getAppelByClient(String uid) {
    // code to convert the first character to uppercase

    _appel.where("userId", isEqualTo: uid).get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _apell.add(ApellModel.fromJson(value.docs[i].data()));
      }
      print(_apell.length);
    });
  }
}
