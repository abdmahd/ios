import 'package:final_project/Artisan/HomeArt.dart';
import 'package:final_project/Artisan/loginView_Art.dart';
import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModelArtisan extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;

  String fullname,
      username,
      age,
      wilaya,
      email,
      pic,
      password,
      phonenumber,
      confimP = '',
      prof;

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // ignore: todo
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    // ignore: non_constant_identifier_names
    final AuthCredential Credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(Credential).then((artisan) async {
      saveUserArt(artisan);
      Get.offAll(HomeArt());
    });
  }

  void signInWithEmailAndPasswordArt() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeArt());
    } catch (e) {
      print("$e");
      Get.snackbar("Error login account", "$e",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPasswordArt() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUserArt(user);
        Get.offAll(MainScreen());
        Get.snackbar("Account is Create ", "Success");
      }).catchError((onError) => Get.snackbar(
              "Error In Creating Account", onError.message,
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error login account',
        "$e",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUserArt(UserCredential user) async {
    ArtisanModel artisanModel = (ArtisanModel(
        artisanId: user.user.uid,
        fullname: fullname == null ? user.user.displayName : fullname,
        username: username == null ? user.user.displayName : username,
        age: age == null ? "vide" : age,
        wilaya: wilaya == null ? "vide" : wilaya,
        email: user.user.email.toString(),
        pic:
            "https://firebasestorage.googleapis.com/v0/b/final-project-25372.appspot.com/o/logo.png?alt=media&token=b7bc4a2c-aa5c-48df-8988-a1ccd03d88ca",
        phonenumber: phonenumber == null ? "vide" : phonenumber,
        prof: prof));
    await FireStoreUsers().addUserToFireStoreArtisan(artisanModel);
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginViewArt());
      Get.snackbar("Password Reset email link is been sent", "Success");
      // ignore: invalid_return_type_for_catch_error
    }).catchError((onError) => Get.snackbar(
        "Error In Email Reset", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
  }

  String validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    } else {
      if (!value.endsWith('@gmail.com')) {
        return "email must ends with @gmail.com";
      }
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String validateFullname(String value) {
    if (value.isEmpty == true) {
      return "Full Name vide";
    }
  }

  String validateUsername(String value) {
    if (value.isEmpty == true) {
      return "Username  vide";
    }
  }

  String validateCPassword(String value) {
    if (confimP != password) {
      return "Password wrong";
    }
  }

  String validatePhone(String value) {
    if (value.isEmpty == true) {
      return "phone number vide";
    } else {
      if ((!value.startsWith('05')) || (value.length != 10)) {
        if ((!value.startsWith('07')) || (value.length != 10)) {
          if ((!value.startsWith('06')) || (value.length != 10)) {
            return "phone number must start with 05 06 07 \n and containes 10 numbers";
          }
        }
      }
    }
  }

  String validateAge(String value) {
    if (value.isEmpty == true) {
      return "age vide";
    } else {
      if (value.length != 2) {
        return 'age invalide';
      }
    }
  }

  String validateCity(String value) {
    if (value.isEmpty == true) {
      return "City vide";
    }
  }
}
