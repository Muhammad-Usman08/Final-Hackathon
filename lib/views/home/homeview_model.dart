import 'package:get/get.dart';

class HomeviewModel extends GetxController {
  RxBool isWalking = false.obs;


  void toggleWalk(){
    isWalking.value=!isWalking.value;
  }


}
