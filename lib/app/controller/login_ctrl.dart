import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mejidigital/app/app_data/const.dart';

import '../screen/botto_nav.dart';

class LoginCtrl extends GetxController  {
  final emailEditCtrl = TextEditingController().obs;
  final passwordEditCtrl = TextEditingController().obs;
 final RxList LogiData = [].obs;
 
Future<void> login() async {
  final response = await http.post(
    Uri.parse(Api.login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': emailEditCtrl.value.text,
      'password': passwordEditCtrl.value.text,
    }),
  );
  if (response.statusCode == 200) {
      try {
        final responseData = jsonDecode(response.body);
    Get.to(BottomNavBar());
        Get.snackbar('Login Successful', 'Welcome back');
  
        LogiData.addAll(responseData);
           const Duration(seconds: 4);
       
      } catch (e) {
        // Log JSON decoding errors
        print('Error decoding JSON: $e');
      }
  
  } else {
    print('Failed to login: ${response.reasonPhrase}');
  }
}


final isVisible = false.obs;
void showPassword() {
  isVisible.value = !isVisible.value;
}

}