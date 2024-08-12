import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/screen/profile.dart';
import 'package:mejidigital/app/utils/colors.dart';

import '../controller/bottom_nav_ctrl.dart';
import '../controller/home_ctrl.dart';
import 'home_page.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final homeCtrl = Get.put(BottomNavCtrl());

  List<Icon> listOfIcons = [
    const Icon(Icons.home),
    const Icon(Icons.assignment_outlined),
    const Icon(Icons.add_circle_outline_outlined),
    const Icon(Icons.shopping_cart_outlined),
    const Icon(Icons.person_outline),
  ];
  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'My Orders';
      case 2:
        return 'Place an Add';
      case 3:
        return 'Cart';
      case 4:
        return 'My Account';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: homeCtrl.pageController,
        onPageChanged: (index) {
          homeCtrl.SetState(index);
        },
        children: <Widget>[
        HomePage(),
       Container(
            color: Colors.grey,
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "It's almost here! Get ready for something amazing!",
                textAlign: TextAlign.center,
              ),
            )),
          ),
          Container(
            color: Colors.grey,
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "It's almost here! Get ready for something amazing!",
                textAlign: TextAlign.center,
              ),
            )),
          ),
          Container(
            color: Colors.grey,
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "It's almost here! Get ready for something amazing!",
                textAlign: TextAlign.center,
              ),
            )),
          ),
   
        MyProfile(),

        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: Get.width * .200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
         padding: EdgeInsets.symmetric(horizontal: size.width * .0),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              homeCtrl.SetState(index);
              homeCtrl.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == homeCtrl.currentIndex.value
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .150,
                      height: index == homeCtrl.currentIndex.value
                          ? size.width * .014
                          : 0,
                    )),
                Obx(() => Container(
                      alignment: Alignment.center,
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == homeCtrl.currentIndex.value
                            ? AppColors.success
                            : null,
                      ),
                      child: Icon(
                        listOfIcons[index].icon,
                        color: index == homeCtrl.currentIndex.value
                            ? Colors.white
                            : Colors.grey.withOpacity(0.5),
                        size: 25,
                      ),
                    )),
                Obx(() => Text(
                      getTitle(index),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: index == homeCtrl.currentIndex.value
                            ? AppColors.success
                            : Colors.grey.withOpacity(0.5),
                      ),
                    )),
                SizedBox(height: Get.width * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
