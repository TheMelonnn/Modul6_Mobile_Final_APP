// ignore_for_file: unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff13131b),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 20),
                child: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                height: 100,
                width: 600,
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 0),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          ' "Buku adalah cara unik manusia untuk memandang dunia. Buku menjelajahi semua bagian kehidupan, mengubah kehidupan, dan memungkinkan untuk melihat berbagai hal secara berbeda. Buku dapat mengubah hidupmu."',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/book.png',
                      width: 100,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 10),
                child: const Text(
                  'POPULAR NOW',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://www.gramedia.com/blog/content/images/2023/07/3-1.jpeg',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://www.gramedia.com/blog/content/images/2023/07/5-1.jpeg',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://www.gramedia.com/blog/content/images/2023/07/7.jpeg',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://www.gramedia.com/blog/content/images/2023/05/4-5.jpg',
                        width: 160,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  'Recomend By Google',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 226,
                child: Obx(() {
                  if (controller.bookData.isEmpty) {
                    return Text("Kosong");
                  }

                  return ListView.builder(
                    itemCount: controller.bookData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              controller.bookData[index]["volumeInfo"]
                                  ["imageLinks"]["thumbnail"],
                              width: 160,
                              height: 200,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
