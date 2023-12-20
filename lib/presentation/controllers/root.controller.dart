import 'package:get/get.dart';

class RootController extends GetxController {
  final count = 0.obs;

  Future<RootController> init() async {
    const duration = Duration(seconds: 5);

    Future.delayed(duration, () => ++count.value);
    print("RootController:: Future init ${count.value}");

    return this;
  }

  @override
  void onInit() {
    super.onInit();
    ++count.value;
    print("RootController:: onInit ${count.value}");
  }

  @override
  void onReady() {
    super.onReady();
    ++count.value;
    print("RootController:: onReady ${count.value}");
  }

  @override
  void onClose() {
    super.onClose();
    --count.value;
    print("RootController:: onClose ${count.value}");
  }

  void increment() {
    count.value++;
    print("RootController:: increment ${count.value}");
  }
}
