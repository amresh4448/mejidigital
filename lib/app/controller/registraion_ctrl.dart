import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app_data/const.dart';
import '../screen/botto_nav.dart';
class RegistraionCtrl extends GetxController {
  final firstNameEditCtrl = TextEditingController().obs;
  final familyNameEditCtrl = TextEditingController().obs;
  final emailEditCtrl = TextEditingController().obs;
  final passwordEditCtrl = TextEditingController().obs;


Future<void> register() async {
  final response = await http.post(
    Uri.parse(Api.register),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName': firstNameEditCtrl.value.text,
      'familyName': familyNameEditCtrl.value.text,
      'email': firstNameEditCtrl.value.text,
      'password': passwordEditCtrl.value.text,
    }),
  );
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
     Get.to(BottomNavBar());
    // I/flutter ( 6124): Login successful: {firstName: Amresh, familyName: amresh, email: Amresh, password: 123456}
firstNameEditCtrl.value.text = responseData['firstName'];
familyNameEditCtrl.value.text = responseData['familyName'];
emailEditCtrl.value.text = responseData['email'];


    print('Register successful: ${responseData}');
  } else {
    print('Failed to login: ${response.reasonPhrase}');
  }
}
}