import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';

class BottomNavbarWidget extends StatelessWidget {
  BottomNavbarWidget({super.key});

  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (context) {
      return Obx((() {
        return BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: controller.changeTabIndex,
          items: [
            _bottombarIntem(Icons.book, "book"),
            _bottombarIntem(Icons.favorite, "favorite"),
            _bottombarIntem(Icons.home, "home"),
            _bottombarIntem(Icons.my_library_add, "MyBook"),
            _bottombarIntem(Icons.account_circle_outlined, "account"),
          ],
        );
      }));
    });
  }
}

_bottombarIntem(IconData icon, String label) {
  return BottomNavigationBarItem(
      icon: Icon(icon), label: label, backgroundColor: Colors.black);
}
