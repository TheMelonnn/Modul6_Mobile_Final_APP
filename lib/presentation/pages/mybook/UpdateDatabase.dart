// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';
import 'package:module_app/presentation/components/booklist/booklist.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';

class UpdateDatabasePage extends GetView<DashboardController> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final DatabaseController _databasecontroller = Get.put(DatabaseController());
  final TextEditingController _judul = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();

  String getBookId() {
    final Map arguments = Get.arguments;
    return arguments["book_id"];
  }

  UpdateDatabasePage({super.key});
  @override
  Widget build(BuildContext context) {
    final String bookId = getBookId();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Buku'),
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
              const SizedBox(height: 190),
              Text(
                'Received Book ID: $bookId',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
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
                    await _databasecontroller.updateDocument(bookId, {
                      'Judul_Buku': title,
                      'Deskripsi_Buku': description,
                    });

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
                child: const Text('Update'),
              ),
              const SizedBox(height: 300),
              BookList(controller.bookInfos.toList()),
            ],
          ),
        ),
      ),
    );
  }
}
