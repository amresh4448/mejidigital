import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavCtrl extends GetxController  {





    final RxInt currentIndex = 0.obs;
  final RxInt currentCharIndex = 0.obs;

  
  @override
  void onInit() {
   pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
        pageController.dispose();

    super.onClose();
  }


   void SetState(index) {
    currentIndex.value = index;
  }

  late PageController pageController;

final RxList  charList = ['Latest', 'Job', 'properties', 'Cars', 'Services', 'Plans', 'Buy&Sell', 'I', 'A', 'L'].obs;









}
