import 'package:get/get.dart';
import 'package:module_app/data/models/post.dart';

class FavoriteController extends GetxController {
  final favoriteController = Get.put(FavoriteController());
  RxList<Post> posts = RxList([]);

  Future<void> fetchPosts() async {
  }
}
