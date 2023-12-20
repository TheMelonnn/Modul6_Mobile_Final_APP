
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/pages/dashboard/dashboard.dart';

import '../pages/login/userlogin_page.dart';
import 'client_controller.dart';

class AccountController extends ClientController {
  RxBool isLoading = false.obs;
  Account? account;
  @override
  void onInit() {
    super.onInit();
// appwrite
    account = Account(client);
  }

  Future createAccount(String email, String password, String name) async {
    try {
      isLoading.value = true;
      final result = await account!.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(userLoginPage()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
  
  Future createEmailSession(String email, String password) async {
    isLoading.value = true;
    try {
      final result = await account!.createEmailSession(
        email: email,
        password: password,
      );
      print("AccountController:: createEmailSession $result");
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.off(DashboardPage());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
