// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:app/consts/images.dart';

import 'package:app/consts/lists.dart';
import 'package:app/consts/styles.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/home_controller.dart';
import 'package:app/controller/product_controller.dart';
import 'package:app/services/firestore_services.dart';

import 'package:app/views/spash_screen/applogo_widget.dart';
import 'package:app/views/spash_screen/auth_screen/login_screen.dart';
import 'package:app/views/spash_screen/category_screen/category_screen.dart';
import 'package:app/views/spash_screen/category_screen/item_details.dart';
import 'package:app/views/spash_screen/chatscreen.dart';

import 'package:app/views/spash_screen/home_screen/components/featured_button.dart';
import 'package:app/views/spash_screen/home_screen/search_screen.dart';
import 'package:app/views/spash_screen/profile_screen/profile_screen.dart';
import 'package:app/views/testscreen.dart';
import 'package:app/widgets_common/loading_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../consts/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var catController = Get.put(ProductController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: redColor,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  child: applogoWidget(),
                )),
            50.heightBox,
            ListTile(
              leading: const Icon(
                Icons.air, // İstediğiniz simgeyi burada belirtebilirsiniz
                size: 30,
                color: darkFontGrey,
              ),
              title: 'AI Chat'
                  .text
                  .fontFamily(bold)
                  .size(22)
                  .color(darkFontGrey)
                  .make(),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons
                    .category_sharp, // İstediğiniz simgeyi burada belirtebilirsiniz
                size: 30,
                color: darkFontGrey,
              ),
              title: 'Modules'
                  .text
                  .fontFamily(bold)
                  .size(22)
                  .color(darkFontGrey)
                  .make(),
              onTap: () {
                Get.to(const CategoryScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.quiz, // İstediğiniz simgeyi burada belirtebilirsiniz
                size: 30,
                color: darkFontGrey,
              ),
              title: 'Quiz'
                  .text
                  .fontFamily(bold)
                  .size(22)
                  .color(darkFontGrey)
                  .make(),
              onTap: () {
                Get.to(const QuizScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons
                    .account_circle_outlined, // İstediğiniz simgeyi burada belirtebilirsiniz
                size: 30,
                color: darkFontGrey,
              ),
              title: 'My Account'
                  .text
                  .fontFamily(bold)
                  .size(22)
                  .color(darkFontGrey)
                  .make(),
              onTap: () {
                Get.to(const ProfileScreen());
              },
            ),
            100.heightBox,
            ListTile(
              leading: const Icon(
                Icons
                    .logout_outlined, // İstediğiniz simgeyi burada belirtebilirsiniz
                size: 30,
                color: darkFontGrey,
              ),
              onTap: () async {
                await Get.put(AuthController()).signoutMethod(context: context);
                Get.offAll(() => const LoginScreen());
              },
              title: 'Log out'
                  .text
                  .fontFamily(bold)
                  .size(22)
                  .color(darkFontGrey)
                  .make(),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        width: context.screenWidth,
        height: context.screenHeight,
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: lightGrey,
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                controller: controller.searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.search).onTap(() {
                      if (controller
                          .searchController.text.isNotEmptyAndNotNull) {
                        Get.to(() => SearchScreen(
                              title: controller.searchController.text,
                            ));
                      }
                    }),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: const TextStyle(color: textfieldGrey)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    20.heightBox,
                    const Text(
                      "What is app",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    10.heightBox,
                    const Text(
                      "app  is called Information Technology Infrastructure Library. app service management methodology has been developed to manage IT services completely and with the best quality. app guides its users to maintain the best service management.",
                      style: TextStyle(color: Colors.white),
                    ),
                    20.heightBox,
                    Image.asset(imghome),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
