// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';
import 'package:module_app/presentation/components/booklist/booklist.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';

class Mybook extends GetView<DashboardController> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final DatabaseController _databasecontroller = Get.put(DatabaseController());
  final TextEditingController _judul = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();

  Mybook({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Buku'),
        backgroundColor: const Color(0xff13131b),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff13131b),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Container(
                width: 300,
                child: TextField(
                  controller: _judul,
                  decoration: const InputDecoration(
                    labelText: 'Judul',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 300,
                child: TextField(
                  controller: _deskripsi,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final title = _judul.text;
                  final description = _deskripsi.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    // Reset input fields
                    titleController.clear();
                    descriptionController.clear();

                    await _databasecontroller.createDocument({
                      'Judul_Buku': title,
                      'Deskripsi_Buku': description,
                    });

                    // Inform user that the book was uploaded
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Buku berhasil diupload ke dalam daftar')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Silakan isi semua informasi terlebih dahulu')),
                    );
                  }
                },
                child: const Text('Create'),
              ),
              const SizedBox(height: 260),
              BookList(controller.bookInfos.toList()),
            ],
          ),
        ),
      ),
    );
  }
}
