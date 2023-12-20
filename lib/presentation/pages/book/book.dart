import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';
import '../../components/booklist/booklist.dart';

class Book extends GetView<DashboardController> {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
      ),
      body: BookList(controller.bookInfos, key: UniqueKey()),
    );
  }
}
