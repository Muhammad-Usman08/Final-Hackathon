import 'package:get/get.dart';

class ResviewModel extends GetxController {
    RxBool isDelivery = false.obs;


  void toggleWalk(){
    isDelivery.value=!isDelivery.value;
  }
}