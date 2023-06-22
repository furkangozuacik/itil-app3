import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/consts/colors.dart';
import 'package:app/consts/images.dart';
import 'package:app/consts/lists.dart';
import 'package:app/consts/strings.dart';
import 'package:app/consts/styles.dart';
import 'package:app/controller/product_controller.dart';

import 'package:app/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, this.title, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
          backgroundColor: lightGrey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                controller.resetValues();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                ),
              ),
              Obx(
                () => IconButton(
                  onPressed: () {
                    if (controller.isFav.value) {
                      controller.removeFromWishList(data.id, context);
                    } else {
                      controller.addToWishList(data.id, context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: controller.isFav.value ? redColor : darkFontGrey,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //swiper
                          VxSwiper.builder(
                              autoPlay: true,
                              height: 350,
                              itemCount: data['p_imgs'].length,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  data['p_imgs'][index],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                              }),
                          10.heightBox,
                          //title and details
                          title!.text
                              .size(16)
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,

                          "Description"
                              .text
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,
                          "${data['p_desc']}".text.color(darkFontGrey).make(),
                          10.heightBox,
                        ]
                        //our details ui completed.
                        ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
