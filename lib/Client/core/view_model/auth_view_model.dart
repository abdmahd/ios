import 'package:final_project/Admin/gestion%20comptes/Appel.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/service/FirestoreService.dart';

import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:final_project/Client/loginView.dart';
import 'package:final_project/Client/model/Demande.dart';
import 'package:final_project/Client/model/Signal.dart';
import 'package:final_project/Client/model/apeel_model.dart';
import 'package:final_project/Client/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController, passwordController;

  String fullname,
      username,
      age,
      wilaya,
      email,
      pic,
      password,
      phonenumber,
      confimP = '',
      typework,
      location,
      typeraport,
      descriptionsignal,
      newEmail,
      description;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    // ignore: non_constant_identifier_names
    final AuthCredential Credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(Credential).then((user) async {
      await FireStoreService().getUserCurr(_auth.currentUser.uid);
      saveUser(user);

      Get.offAll(HomeCLient());
    });
  }

  final box = GetStorage();
  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreService().getUserCurr(_auth.currentUser.uid);
        Get.offAll(HomeCLient());
      });
    } catch (e) {
      print("$e");
      Get.snackbar("Error login account", "$e",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        FireStoreService().getUserCurr(_auth.currentUser.uid);
        saveUser(user);
      });
      Get.offAll(HomeCLient());
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

  addAppele() async {
    ApellModel appelmodel = (ApellModel(
      userId: _auth.currentUser.uid,
      typework: typework,
      location: location,
      description: description,
    ));
    print(_auth.currentUser.uid);
    await FireStoreUsers().addAppeleToFireStore(appelmodel).then((value) {
      Get.offAll(HomeCLient());
      Get.snackbar(" Appele is add", "Success");
    }).catchError((onError) => Get.snackbar(
        "Error In Adding this appele", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
  }

  final before = GetStorage();

  void updateUser() async {
    before.write("usser", box.read("user"));
    UserModel userModel = (UserModel(
        userId: _auth.currentUser.uid,
        fullname: fullname,
        username: username,
        age: age,
        wilaya: wilaya,
        email: _auth.currentUser.email,
        pic: 'default',
        phonenumber: phonenumber));

    await FireStoreUsers().addUserToFireStore(userModel).then((value) {
      Get.offAll(HomeCLient());
      Get.snackbar(" Profil is Updated", "Succesufully");
    }).catchError((onError) => Get.snackbar(
        "Error In Changing the ", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
    update();
  }

  void updateappel() async {
    print(description);
    ApellModel apellModel = (ApellModel(
      userId: _auth.currentUser.uid,
      description: description,
      typework: typework,
      location: location,
    ));

    await FireStoreUsers().addAppeleToFireStore(apellModel).then((value) {
      Get.offAll(HomeCLient());
      Get.snackbar(" Profil is Updated", "Succesufully");
    }).catchError((onError) => Get.snackbar(
        "Error In Changing the ", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
    update();
  }

  addDemande(String uid) async {
    Demande demandemodel = (Demande(
      userId: _auth.currentUser.uid,
      artisanId: uid,
      typeWork: typework,
      wilaya: wilaya,
      description: description,
    ));
    print(_auth.currentUser.uid);
    await FireStoreUsers().addDemandeToFireStore(demandemodel).then((value) {
      Get.offAll(HomeCLient());
      Get.snackbar(" Demande is add", "Success");
    }).catchError((onError) => Get.snackbar(
        "Error In Adding this Demande", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
  }

  addSignal(String uid) async {
    SignalModel signalmodel = (SignalModel(
      userId: _auth.currentUser.uid,
      artisanId: uid,
      typeraport: typeraport,
      descriptionsignal: descriptionsignal,
    ));
    print(_auth.currentUser.uid);
    await FireStoreUsers().addSignalToFireStore(signalmodel).then((value) {
      Get.offAll(HomeCLient());
      Get.snackbar(" Signal is send we wil Traite your probleme", "Success");
    }).catchError((onError) => Get.snackbar(
        "Error In Adding this Signal", onError.message,
        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM));
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = (UserModel(
        userId: user.user.uid,
        fullname: fullname == null ? user.user.displayName : fullname,
        username: username == null ? user.user.displayName : username,
        age: age == null ? "vide" : age,
        wilaya: wilaya == null ? "vide" : wilaya,
        email: user.user.email.toString(),
        pic: 'default',
        phonenumber: phonenumber == null ? "vide" : phonenumber));
    await FireStoreUsers().addUserToFireStore(userModel);
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginView());
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

  // ignore: missing_return
  String validateFullname(String value) {
    if (value.isEmpty == true) {
      return "Full Name vide";
    }
  }

  // ignore: missing_return
  String validateUsername(String value) {
    if (value.isEmpty == true) {
      return "Username  vide";
    }
  }

  // ignore: missing_return
  String validateCPassword(String value) {
    if (confimP != password) {
      return "Password incorect";
    }
  }

  // ignore: missing_return
  String validatePhone(String value) {
    if (value.isEmpty == true) {
      return "phone number vide";
    } else {
      if ((value.startsWith('05')) || (value.length != 10)) {
        if ((value.startsWith('07')) || (value.length != 10)) {
          if ((value.startsWith('06')) || (value.length != 10)) {
            return "phone number must start with 05 06 07 \n and containes 10 numbers";
          }
        }
      }
    }
  }

  // ignore: missing_return
  String validateAge(String value) {
    if (value.isEmpty == true) {
      return "age vide";
    } else {
      if (value.length != 2) {
        return 'age invalide';
      }
    }
  }

  // ignore: missing_return
  String validateCity(String value) {
    if (value.isEmpty == true) {
      return "City vide";
    }
  }
}
