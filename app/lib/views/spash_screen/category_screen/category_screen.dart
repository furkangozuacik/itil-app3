import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:app/consts/colors.dart';
import 'package:app/consts/consts.dart';
import 'package:app/consts/lists.dart';
import 'package:app/widgets_common/bg_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:app/controller/product_controller.dart';
import '../../../consts/styles.dart';
import 'category_details.dart';
import 'item_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(title: categories.text.fontFamily(bold).make()),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                controller.getSubCategories(categoriesList[index]);
                Get.to(() => ItemDetails(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
