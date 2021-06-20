import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/model/apeel_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FireStoreService extends GetxController {
  List<ArtisanModel> get artisanBySearsh => _artisanbysearch;
  List<ArtisanModel> _artisanbysearch = [];

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference _artisanCollectionRef =
      FirebaseFirestore.instance.collection('Artisans');
  Future<List<QueryDocumentSnapshot>> getArtisan() async {
    var value = await _artisanCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUsers() async {
    var user = await _userCollectionRef.get();
    return user.docs;
  }

  final CollectionReference _appeloffert =
      FirebaseFirestore.instance.collection('Appel');

  Future<List<QueryDocumentSnapshot>> getAppels() async {
    var value = await _appeloffert.get();
    return value.docs;
  }

  final box = GetStorage();

  // ignore: missing_return
  Future<List<QueryDocumentSnapshot>> getUserCurr(String uid) async {
    await _userCollectionRef.doc(uid).get().then((value) {
      box.write("user", value.data());
    });
  }

  final art = GetStorage();

  // ignore: missing_return
  Future<List<QueryDocumentSnapshot>> getArtCurr(String uid) async {
    await _artisanCollectionRef.doc(uid).get().then((value) {
      art.write("artisan", value.data());
    });
  }

  // ignore: missing_return
  Future<List<QueryDocumentSnapshot>> searchArtisan(String artisanName) {
    // code to convert the first character to uppercase

    _artisanCollectionRef
        .where("fullname", isEqualTo: artisanName)
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _artisanbysearch.add(ArtisanModel.fromJson(value.docs[i].data()));
      }
      print(_artisanbysearch.length);
    });
  }
}
