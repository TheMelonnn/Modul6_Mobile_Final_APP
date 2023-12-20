// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';
import 'package:module_app/presentation/routes/routes.dart';

class Favorite extends GetView<DashboardController> {
  final DatabaseController _databasecontroller = Get.put(DatabaseController());

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Buku'),
          backgroundColor: const Color(0xff13131b),
        ),
        body: Container(
          color: const Color(0xff13131b),
          child: ListView.builder(
            itemCount: controller.databaseController.bookData.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Id: " +
                            controller.databaseController.bookData[index].$id,
                        style: const TextStyle(color: Colors.grey)),
                    Text(
                      controller.databaseController.bookData[index]
                          .data['Judul_Buku'],
                      style:
                          const TextStyle(fontSize: 30, color: Colors.orange),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Deskripsi : " +
                          controller.databaseController.bookData[index]
                              .data['Deskripsi_Buku'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              final document_id = controller
                                  .databaseController.bookData[index].$id;
                              await _databasecontroller
                                  .deleteDocument(document_id);
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.red)),
                            child: const Text("Delete")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              String book_id = controller
                                  .databaseController.bookData[index].$id;
                              Get.toNamed(AppPage.UpdateDatabase,
                                  arguments: {"book_id": book_id});
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.orange)),
                            child: const Text("Update")),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
