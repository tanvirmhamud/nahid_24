import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/shop_card_provider.dart';
import 'package:nahid_24/application/app/shop/shop_provider.dart';
import 'package:nahid_24/screens/product/book_details_screen.dart';
import 'package:nahid_24/screens/product/books_screen.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';

import '../../../getx/selectbtn.dart';

class ShopProductsTile extends HookConsumerWidget {
  ShopProductsTile({
    Key? key,
  }) : super(key: key);

  final _controller = Get.put(Btncontroller());

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(Duration(seconds: 1), () {
        ref.read(shopProvider.notifier).getAllProducts();
      });

      return null;
    }, []);

    final products = ref.watch(shopProvider).products;

    return Expanded(
      child: Container(
        color: Color(0xffE5E5E5),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // mainAxisExtent: 241,
            childAspectRatio: 0.71,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext, index) {
            print(products[index].photo);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BookDetailsScreen(
                          product: products[index],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 10),
                        AspectRatio(
                            aspectRatio: 1.1,
                            child: CachedNetworkImage(
                              imageUrl: products[index].photo,
                              fit: BoxFit.contain,
                              errorWidget: (context, url, error) =>
                                  SizedBox.shrink(),
                            )),
                        Column(
                          children: [
                            Text(
                              products[index].name,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              products[index].price,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Obx(() {
                              return SumitButton(
                                  radius: 5,
                                  width: 120,
                                  height: 20,
                                  onTap: () {
                                    _controller.addproduct(products[index]);
                                    ref
                                        .read(shopCartProvider.notifier)
                                        .addToCart(products[index]);
                                  },
                                  title: "Add to Cart",
                                  color: _controller.productmodel
                                          .contains(products[index])
                                      ? Colors.purple.withOpacity(0.9)
                                      : PColor.containerColor);
                            })
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
