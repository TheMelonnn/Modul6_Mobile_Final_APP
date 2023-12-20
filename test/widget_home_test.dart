import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/pages/account/new_account.dart';

void main() {
  testWidgets('UserProfile Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: UserProfile(),
      ),
    );

    // Verify that the "User Profile" text is present.
    expect(find.text('User Profile'), findsOneWidget);

    // Verify that the "User" text is present.
    expect(find.text('User'), findsOneWidget);

    // Verify that the "email@gmail.com" text is present.
    expect(find.text('email@gmail.com'), findsOneWidget);

    // Verify that the "Indonesia" text is present.
    expect(find.text('Indonesia'), findsOneWidget);

    // Verify that the "View More" button is present.
    expect(find.text('View More'), findsOneWidget);



    // You can add more specific tests based on your widget's behavior.

    // Clean up after the test.
    Get.reset(); // Reset the GetX bindings to avoid conflicts with other tests.
  });
}