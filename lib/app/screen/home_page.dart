import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mejidigital/app/app_data/component/textfiled.dart';
import 'package:mejidigital/app/utils/colors.dart';
import '../app_data/component/service_card.dart';
import '../controller/home_ctrl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeCtrl = Get.put(HomeCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 8),
          child: Image.asset(
            "assets/images/logo.png",
            scale: 3.5,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(color: AppColors.success, thickness: 1),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(homeCtrl.charList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            homeCtrl.charList[index],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                    ),
                  )),
              const SizedBox(height: 8),
          
          SearchTextFormField(
  controller: homeCtrl.searchTextEditCtrl.value,
  onClear: () {
    homeCtrl.searchTextEditCtrl.value.clear();
    homeCtrl.filteredItems.value = homeCtrl.items; // Reset the filtered items to original list
  },
  onChanged: (value) {
    homeCtrl.filteredItems.value = homeCtrl.items.where((item) {
      final titleLower = item.title.toLowerCase();
      final subtitleLower = item.subtitle.toLowerCase();
      final searchLower = value.toLowerCase();

      return titleLower.contains(searchLower) ||
             subtitleLower.contains(searchLower);
    }).toList();
  },
  filter: () {},
),
const SizedBox(height: 12),

Obx(() {
  if (homeCtrl.filteredItems.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: homeCtrl.filteredItems.length,
    itemBuilder: (context, index) {
      final item = homeCtrl.filteredItems[index];
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              item.subtitle,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              ),
            ),
          ],
        ),
      );
    },
  );
}),


                      const SizedBox(height: 16),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Book Service",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.success,
                        fontWeight: FontWeight.bold))),
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(homeCtrl.serviceList.length, (index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ServiceCard(title: homeCtrl.serviceList[index],));
                    }),
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }
}



