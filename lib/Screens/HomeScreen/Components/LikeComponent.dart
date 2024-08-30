import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LikeController extends GetxController {
  var isLiked = false.obs;  // Reactive variable for like status
  var likeOpacity = 0.0.obs; // Reactive variable for like icon opacity

  void onDoubleTap() {
    isLiked.value = !isLiked.value;
    likeOpacity.value = 1.0;

    // Fade out the like icon after 500ms
    Future.delayed(Duration(milliseconds: 500), () {
      likeOpacity.value = 0.0;
    });
  }
}