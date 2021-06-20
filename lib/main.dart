import 'package:final_project/Admin/Auth_view/AuthAdmin.dart';
import 'package:final_project/Admin/gestion%20comptes/ArtisanAccount.dart';
import 'package:final_project/Admin/gestion%20comptes/Comptes.dart';
import 'package:final_project/Admin/gestion%20comptes/UserAccount.dart';
import 'package:final_project/Admin/gestion%20reclamation/Reclamation.dart';
import 'package:final_project/Admin/screens/main/main_screen.dart';
import 'package:final_project/Admin/signalements/Signalements.dart';
import 'package:final_project/Admin/soumission/Soumission.dart';
import 'package:final_project/Client/AppelOffert.dart';
import 'package:final_project/Client/Art.dart';
import 'package:final_project/Client/Ask.dart';
import 'package:final_project/Client/DetailsViews.dart';
import 'package:final_project/Client/ForgetPass.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/ProfilView.dart';
import 'package:final_project/Client/SignView.dart';
import 'package:final_project/Client/loginView.dart';
import 'package:final_project/Guest/Guestshow.dart';
import 'package:final_project/Home/contactus.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Client/constants.dart';
import 'Client/helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'Final Project',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LoginView.routeName: (context) => LoginView(),
        SignScreen.routeName: (context) => SignScreen(),
        HomeCLient.routeName: (context) => HomeCLient(),
        ForgotPassword.routeName: (context) => ForgotPassword(),
        DetailsView.routeName: (context) => DetailsView(),
        ProfilView.routeName: (context) => ProfilView(),
        Ask.routeName: (context) => Ask(),
        Art.routeName: (context) => Art(),
        AppleOffer.routeName: (context) => AppleOffer(),
        Contact_us.routeName: (context) => Contact_us(),
        GusetShow.routeName: (context) => GusetShow(),
        AuthAdmin.routeName: (context) => AuthAdmin(),
        MainScreenAdmin.routeName: (context) => MainScreenAdmin(),
        UserAccounts.routeName: (context) => UserAccounts(),
        ArtisanAccounts.routeName: (context) => ArtisanAccounts(),
        Comptes.routeName: (context) => Comptes(),
        Reclamation.routeName: (context) => Reclamation(),
        Soumission.routeName: (context) => Soumission(),
        Signalments.routeName: (context) => Signalments(),
      },
    );
  }
}
