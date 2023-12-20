import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';

void main() async {
  // Ensure Flutter is initialized before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Your other setup code if any

  runApp(GetMaterialApp(home: CrudExampleView()));
}

class CrudExampleView extends StatelessWidget {
  final DatabaseController controller = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Create
                await controller.createDocument({
                  'Judul_Buku': 'Sample Book',
                  'Deskripsi_Buku': 'This is a sample book description',
                });
              },
              child: Text('Create'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Read
                final documentId = 'your_document_id_here';
                // final data = await controller.getDocument(documentId);
                // print('Read: $data');
              },
              child: Text('Read'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Update
                final documentId = 'your_document_id_here';
                await controller.updateDocument(documentId, {
                  'Judul_Buku': 'Updated Book Title',
                  'Deskripsi_Buku': 'Updated book description',
                });
              },
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Delete
                final documentId = 'your_document_id_here';
                await controller.deleteDocument(documentId);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
