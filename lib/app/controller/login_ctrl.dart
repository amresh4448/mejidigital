import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mejidigital/app/app_data/const.dart';

import '../model/user_model.dart';
import '../screen/botto_nav.dart';
import 'registraion_ctrl.dart';

class LoginCtrl extends GetxController {
  final emailEditCtrl = TextEditingController().obs;
  final passwordEditCtrl = TextEditingController().obs;
  final  loginData = <User>[].obs;
  final registraionCtrl = Get.put(RegistraionCtrl());
RxBool isLoading = false.obs;

  
 Future<void> login() async {
if (isLoading.value) return; 
   isLoading.value = true;
  try {
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

    // Check for a successful response
    if (response.statusCode == 200) {
      // Try to parse the response body
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final User user = User.fromJson(responseData);
        
        // Update the login data and registration controls
        loginData.value = [user];
        registraionCtrl.firstNameEditCtrl.value.text = loginData.value.first.firstName;
        registraionCtrl.familyNameEditCtrl.value.text = loginData.value.first.lastName;
        registraionCtrl.emailEditCtrl.value.text = loginData.value.first.email;

        // Navigate to the next screen and show success message
        Get.to(BottomNavBar());
        Get.snackbar('Login Successful', 'Welcome back');
      } catch (e) {
        isLoading.value = false; 
        // JSON parsing error
        Get.snackbar('Login Failed', 'Failed to parse response');
      }
    } else {
      isLoading.value = false; 
      // Handle HTTP errors
      Get.snackbar('Login Failed', 'Server error: ${response.statusCode}');
    }
  } catch (e) {
    isLoading.value = false; 
    Get.snackbar('Login Failed', 'An error occurred: $e');
    print('Error during login: $e');
  }
}


  final isVisible = false.obs;
  void showPassword() {
    isVisible.value = !isVisible.value;
  }
}
