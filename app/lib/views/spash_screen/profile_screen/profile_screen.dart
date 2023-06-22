import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:app/consts/colors.dart';
import 'package:app/consts/firebase_consts.dart';
import 'package:app/consts/images.dart';
import 'package:app/consts/lists.dart';
import 'package:app/consts/styles.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/profile_controller.dart';
import 'package:app/services/firestore_services.dart';
import 'package:app/views/spash_screen/auth_screen/login_screen.dart';

import 'package:app/views/spash_screen/profile_screen/edit_profile_screen.dart';

import 'package:app/widgets_common/bg_widget.dart';
import 'package:app/widgets_common/loading_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'components/details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
      body: StreamBuilder(
          stream: FireStoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(children: [
                  //edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        )).onTap(() {
                      controller.nameController.text = data["name"];

                      Get.to(() => EditProfileScreen(
                            data: data,
                          ));
                    }),
                  ),
                  //users details section

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                imgProfile2,
                                width: 130,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              )
                          ..box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            5.heightBox,
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                        MaterialButton(
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context: context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child: const Text("Çıkış Yap"))
                      ],
                    ),
                  ),
                  20.heightBox,
                ]),
              );
            }
          }),
    ));
  }
}
