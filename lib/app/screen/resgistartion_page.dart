import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/app_data/component/button.dart';
import 'package:mejidigital/app/app_data/component/textfiled.dart';

import '../controller/registraion_ctrl.dart';
class ResgistartionPage extends StatelessWidget {
  ResgistartionPage({super.key});
 final registraionCtrl = Get.put(RegistraionCtrl());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              scale: 2.5,
            ),
               const SizedBox(
              height: 16,
            ),
        
            const Text(
              "Sign Up With Your Email Address",
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
              height: 12,
            ),
            CustomTextFormField(
              controller: registraionCtrl.passwordEditCtrl.value,
              labelText: 'Password',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.password_rounded,
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
              text: 'Create new account'.toUpperCase(),
              onPressed: () async{
                     if (formKey.currentState!.validate()) {
               await registraionCtrl.register();
      }
              },
            ),
          
          ],
        )),
      ),
    );
  }
}
