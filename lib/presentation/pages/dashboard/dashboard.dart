import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/components/navbar/bottom_navbar.dart';
import 'package:module_app/presentation/pages/account/account.dart';
import 'package:module_app/presentation/pages/account/new_account.dart';
import 'package:module_app/presentation/pages/mybook/Mybook.dart';
import 'package:module_app/presentation/pages/book/book.dart';
import 'package:module_app/presentation/pages/favorite/favorite.dart';
import 'package:module_app/presentation/pages/home/home.dart';
import 'package:module_app/presentation/pages/mybook/UpdateDatabase.dart';

import '../../controllers/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.index.value,
          children: [Book(), Favorite(), Home(), Mybook(), UserProfile()],
        );
      }),
      bottomNavigationBar: BottomNavbarWidget(),
    );
  }
}
