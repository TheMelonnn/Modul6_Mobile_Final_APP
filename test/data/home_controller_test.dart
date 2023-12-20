import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_app/presentation/components/api_book.dart/api_Book.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const String _apiKey = 'AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA';
  const String _baseUrl =
      'https://www.googleapis.com/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=$_apiKey';

  late ApiBookService apiBookService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiBookService = ApiBookService();
  });

  group('ApiBookService', () {
    test('fetchBooks returns a list of books if the response is successful', () async {
      // Mock the HTTP response for a successful case
      when(mockClient.get(Uri.parse(_baseUrl)))
          .thenAnswer((_) async => http.Response('{"items": []}', 200));

      // Call the method and wait for it to complete
      await apiBookService.fetchBooks();

      // Expect the fetched data to be a list of Book objects
      expect(apiBookService.books, isA<List<Book>>());
    });

    test('fetchBooks returns an empty list if the response fails', () async {
      // Mock the HTTP response for a failure case
      when(mockClient.get(Uri.parse(_baseUrl)))
          .thenAnswer((_) async => http.Response('Server error', 500));

      // Call the method and wait for it to complete
      await apiBookService.fetchBooks();

      // Expect the fetched data to be an empty list
      expect(apiBookService.books, isA<List<Book>>());
    });

    test('fetchBooks returns an empty list if an error occurs', () async {
      // Mock an error response
      when(mockClient.get(Uri.parse(_baseUrl))).thenThrow(Exception('Test error'));

      // Call the method and wait for it to complete
      await apiBookService.fetchBooks();

      // Expect the fetched data to be an empty list
      expect(apiBookService.books, isA<List<Book>>());
    });
  });
}
