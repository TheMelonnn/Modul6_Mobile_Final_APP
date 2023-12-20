import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class ApiBookService extends GetxController {
  static const String _baseUrl =
      "https://www.googleapis.com/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA";
  RxList<Book> books = RxList<Book>([]);
  RxBool isLoading = false.obs;
  static final http.Client _client = http.Client();

  Future<void> fetchBooks() async {
    try {
      isLoading.value = true;
      final response = await _client.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final bookResult = BookResult.fromJson(json.decode(jsonData));
        books.value = bookResult.books;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    await fetchBooks();
    super.onInit();
  }
}

class BookResult {
  final List<Book> books;
  BookResult({required this.books});

  factory BookResult.fromJson(Map<String, dynamic> json) => BookResult(
        books: List<Book>.from(
          (json["items"] as List).map((x) => Book.fromJson(x)),
        ),
      );
}

class Book {
  String title;
  String author;
  String description;
  String thumbnailUrl;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.thumbnailUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["volumeInfo"]["title"],
        author: json["volumeInfo"]["authors"]?.isNotEmpty == true
            ? json["volumeInfo"]["authors"][0]
            : "Unknown Author",
        description: json["volumeInfo"]["description"] ?? "No description",
        thumbnailUrl: json["volumeInfo"]["imageLinks"]["thumbnail"],
      );
}
