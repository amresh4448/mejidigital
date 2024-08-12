import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/app_data/component/button.dart';
import 'package:mejidigital/app/app_data/component/textfiled.dart';
import 'package:mejidigital/app/screen/login_page.dart';
import 'package:mejidigital/app/utils/colors.dart';

import '../controller/registraion_ctrl.dart';

class MyProfile extends StatelessWidget {
   MyProfile({super.key});
final registraionCtrl = Get.put(RegistraionCtrl());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 3.5,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(color: AppColors.success, thickness: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         const Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff051F32),
                  fontWeight: FontWeight.bold),
            ),
           
         
     const SizedBox(
              height: 8,
            ),
                 CustomTextFormField(
              controller: registraionCtrl.firstNameEditCtrl.value,
              labelText: 'First Name',
              hintText: 'Jhon',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

             const SizedBox(
              height: 12,
            ),

                   CustomTextFormField(
              controller: registraionCtrl.familyNameEditCtrl.value,
              labelText: 'Family Name',
              hintText: 'Doe',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.family_restroom,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

             const SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              controller: registraionCtrl.emailEditCtrl.value,
              labelText: 'Email Address',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
        
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              color: const Color(0xff2D2B75),
              text: 'UPDATE MY ACCOUNT'.toUpperCase(),
              onPressed: () {
              },
            ),

            const SizedBox(
              height: 20,
            ),
            CustomButton(
              color: const Color(0xff2D2B75),
              text: 'Logout'.toUpperCase(),
              onPressed: () { 
  Future.delayed(
    Duration(seconds: 2),
    () {
                 Get.to(() =>  LoginPage());

    }
  );
             //   registraionCtrl.register();
              },
            ),
        ],
          
        ),
      ),
    );
  }
}