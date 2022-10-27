import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:nahid_24/New_Design/product/widgets/shop_product_tile.dart';

import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../getx/selectbtn.dart';
import '../../screens/home/shopping_cart/shopping_cart_page.dart';


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
      // backgroundColor: PColor.containerColor,
      // drawer: Drawer(child: CustomDrawer()),
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
                    builder: (context) => ShoppingCartpage()));
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
      body: Column(
        children: [
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ))
              ],
            ),
          ),
          ShopProductsTile()
        ],
      ),
    );
  }
}
