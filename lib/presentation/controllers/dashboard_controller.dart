import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';
import 'package:module_app/presentation/controllers/home_controller.dart';

class DashboardController extends GetxController {
  RxList<BookInfo> bookInfos = <BookInfo>[].obs;
  List<RxString> playlistimagePath = List.generate(10, (index) => ''.obs);
  List<RxString> TextContent = List.generate(10, (index) => ''.obs);
  RxString tempimagePath = ''.obs;
  final index = 0.obs;
  final selectedImagePath = ''.obs;
  final homeController = Get.put(HomeController());
  final databaseController = Get.put(DatabaseController());

  @override
  void onInit() {
    homeController.onInit();
    super.onInit();
  }

  void changeTabIndex(int index) {
    this.index.value = index;
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('error', 'no image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future getImageCamera2() async {
    for (var i = 0; i < 10; i++) {
      if (playlistimagePath[i].isEmpty) {
        final ImagePicker picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          playlistimagePath[i].value = image.path.toString();
          tempimagePath.value = playlistimagePath[i].value;
        }

        print('Data:: ${playlistimagePath[i]}');
        break;
      }
    }
  }

  Future getImageGallery2() async {
    for (var i = 0; i < 10; i++) {
      if (playlistimagePath[i].isEmpty) {
        final ImagePicker picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          playlistimagePath[i].value = image.path.toString();
          tempimagePath.value = playlistimagePath[i].value;
        }

        print('Data:: ${playlistimagePath[i]}');
        break;
      }
    }
  }

  Future getText(String text) async {
    for (var i = 0; i < 10; i++) {
      if (TextContent[i].isEmpty) {
        TextContent[i].value = text;
        break;
      }
    }
  }

  void addBookWithInfo(String title, description, imagePath) {
    final bookInfo =
        BookInfo(title: title, description: description, imagePath: imagePath);
    bookInfos.add(bookInfo);
  }
}

class BookInfo {
  final String title;
  final String description;
  final String imagePath;

  BookInfo(
      {required this.title,
      required this.description,
      required this.imagePath});
}
