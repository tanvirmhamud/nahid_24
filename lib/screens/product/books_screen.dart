import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:nahid_24/model_test.dart';
import 'package:nahid_24/screens/home/shopping_cart/shopping_cart_page.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/widget/custom_expanded.dart';
import 'package:nahid_24/widget/quiz_dialogue.dart';
import 'package:flutter/material.dart';

import '../../getx/selectbtn.dart';
import '../drawer/drawer.dart';
import 'widgets/shop_product_tile.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _controller = Get.put(Btncontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.containerColor,
      drawer: Drawer(child: CustomDrawer()),
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 32,
              ));
        }),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ShoppingCartPage()));
              },
              icon: Badge(
                badgeContent: Text(_controller.productmodel.length.toString()),
                position: BadgePosition.topStart(),
                child: Container(
                  child: Image.asset(
                    "assets/cart.png",
                  ),
                ),
              ),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Color(0xffE5E5E5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Books",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                ],
              ),
            ),
            ShopProductsTile()
          ],
        ),
      ),
    );
  }
}

class BookImageList {
  BookImageList({
    required this.image,
    required this.title,
    required this.price,
  });

  Widget image;
  String title;
  String price;
}

List<BookImageList> item = [
  BookImageList(
    image: Image.asset(
      PAssets.book_1,
      fit: BoxFit.cover,
    ),
    title: "বাংলা এ প্লাস",
    price: "160",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_2,
      fit: BoxFit.cover,
    ),
    title: "English A+",
    price: "130",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_3,
      fit: BoxFit.cover,
    ),
    title: "বাংলা এ প্লাস",
    price: "130",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_4,
      fit: BoxFit.cover,
    ),
    title: "English A+",
    price: "160",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_7,
      fit: BoxFit.cover,
    ),
    title: "বাংলা এ প্লাস",
    price: "130",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_5,
      fit: BoxFit.cover,
    ),
    title: "English A+",
    price: "160",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_6,
      fit: BoxFit.cover,
    ),
    title: "বাংলা এ প্লাস",
    price: "130",
  ),
  BookImageList(
    image: Image.asset(
      PAssets.book_8,
      fit: BoxFit.cover,
    ),
    title: "English A+",
    price: "160",
  ),
];
