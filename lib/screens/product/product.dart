import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/shop_card_provider.dart';
import 'package:nahid_24/application/app/shop/shop_provider.dart';

class ProductPage extends HookConsumerWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(Duration(seconds: 1), () {
        ref.read(shopProvider.notifier).getAllProducts();
      });

      return null;
    }, []);

    final products = ref.watch(shopProvider).products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(bottom: 25, top: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 340,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(10),
                // height: 5,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all()),
                      child: CachedNetworkImage(
                        imageUrl: products[index].photo,
                        fit: BoxFit.contain,
                        errorWidget: (context, url, error) => SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      products[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      products[index].price + '৳',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ref
                              .read(shopCartProvider.notifier)
                              .addToCart(products[index]);
                        },
                        child: Text('Add to cart')),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
