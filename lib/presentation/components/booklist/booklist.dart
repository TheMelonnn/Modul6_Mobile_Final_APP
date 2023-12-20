import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';

class BookList extends StatelessWidget {
  final List<BookInfo> bookInfos;
  BookList(List<BookInfo> rxBookInfos, {Key? key})
      : bookInfos = rxBookInfos.obs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: bookInfos.length,
      itemBuilder: (context, index) {
        final bookInfo = bookInfos[index];
        return ListTile(
          title: Text(bookInfo.title),
          subtitle: Text(bookInfo.description),
          leading: Image.file(File(bookInfo.imagePath)),
        );
      },
    );
  }
}
