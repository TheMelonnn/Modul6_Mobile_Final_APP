import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsState();
}

class _AccountsState extends State<AccountsPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.gramedia.com/my-account'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Gramed'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
