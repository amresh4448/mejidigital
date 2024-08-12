import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/app_data/component/button.dart';
import 'package:mejidigital/app/app_data/component/textfiled.dart';
import '../controller/login_ctrl.dart';
import 'botto_nav.dart';
import 'resgistartion_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
 final loginCtrl = Get.put(LoginCtrl());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome To",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff051F32),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/logo.png",
              scale: 2.5,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              controller: loginCtrl.emailEditCtrl.value,
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
            Obx(() => CustomTextFormField(
                          obscureText:loginCtrl.isVisible.value ? true : false,
                          controller: loginCtrl.passwordEditCtrl.value,
                          labelText: 'Password',
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: IconButton(onPressed: (){
                            loginCtrl.showPassword();
                          }, icon: Icon(loginCtrl.isVisible.value?Icons.visibility:Icons.visibility_off)),
                          
                          
                          
                          prefixIcon: Icons.password_rounded,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        )),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              color: const Color(0xff2D2B75),
              text: 'login'.toUpperCase(),
              onPressed: () {
      if (formKey.currentState!.validate()) {
         loginCtrl.login();
      }
             

              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                  
                  onPressed: () {
                    Get.to(ResgistartionPage());
                  },
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
