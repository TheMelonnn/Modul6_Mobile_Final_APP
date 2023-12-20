import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_app/presentation/controllers/home_controller.dart';
import 'package:module_app/presentation/routes/routes.dart';

// import '../../controllers/auth_controller.dart';

class UserProfile extends GetView<HomeController> {
  // final AuthController _authController = Get.put(AuthController());
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff13131b),
        title: Text(
          'User Profile',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: Center(
          child: Container(
            color: const Color(0xFF13131B),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            CircleAvatar(
              radius: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/1 (1).png'),
                radius: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'User',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'email@gmail.com',
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Indonesia',
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Get.toNamed(AppPage.Accounts);
              },
              child: const Text('View More'),
            ),
            SizedBox(
              height: 60,
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 14, color: Colors.blue),
            //   ),
            //   onPressed: () {
            //     _authController.logout();
            //   },
            //   child: const Text('Logout'),
            // ),
          ],
        ),
      )),
    );
  }
}
