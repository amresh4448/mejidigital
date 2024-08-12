import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/model/item_model.dart';

class HomeCtrl extends GetxController  {





    final RxInt currentIndex = 0.obs;
  final RxInt currentCharIndex = 0.obs;

  
  @override
  void onInit() {
   pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
    loadItems();
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
  final searchTextEditCtrl = TextEditingController().obs;




  var items = <Item>[].obs;


  void loadItems() {
    String jsonString = '''
    [
      {
        "title": "UAE pays tribute to life and legacy of Sheikh Khalifa",
        "subtitle": "UAE remembers Sheikh Khalifa bin Zayed Al Nahyan on anniversary of his death",
        "image": "https://images.unsplash.com/photo-1720048170970-3848514c3d60?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      },
      {
        "title": "Revealed: First look at Dubai’s futuristic flying taxi terminal",
        "subtitle": "The new Dubai terminal is expected to be operational by 2026",
        "image": "https://plus.unsplash.com/premium_photo-1664303000625-9da917c7fcfe?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      }
    ]
    ''';

    List<Item> parsedItems = parseItems(jsonString);
    items.value = parsedItems;
  }

  List<Item> parseItems(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => Item.fromJson(json)).toList();
  }





}
