import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;

  BookListItem({this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            imageUrl != null ? Image.network(imageUrl!) : SizedBox.shrink(),
        title: Text(title ?? 'Title not available'),
      ),
    );
  }
}
