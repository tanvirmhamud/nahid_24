import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/Provider/homepage.dart';

import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:provider/provider.dart';

import '../../../getx/selectbtn.dart';
import '../book_details_screen.dart';


class ShopProductsTile extends StatefulWidget {
  const ShopProductsTile({Key? key}) : super(key: key);

  @override
  State<ShopProductsTile> createState() => _ShopProductsTileState();
}

class _ShopProductsTileState extends State<ShopProductsTile> {
  final _controller = Get.put(Btncontroller());

  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getproductlist();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    // useEffect(() {
    //   Future.delayed(Duration(seconds: 1), () {
    //     ref.read(shopProvider.notifier).getAllProducts();
    //   });

    //   return null;
    // }, []);

    // final products = ref.watch(shopProvider).products;

    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: Container(
              color: Color(0xffE5E5E5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: provider.productlist!.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // mainAxisExtent: 241,
                  childAspectRatio: 0.71,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext, index) {
                  var data = provider.productlist!.data![index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BookDetailsScreen(
                            productid: data.id.toString(),
                                product: data,
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
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
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
                                    imageUrl: data.photo!,
                                    fit: BoxFit.contain,
                                    errorWidget: (context, url, error) =>
                                        SizedBox.shrink(),
                                  )),
                              Column(
                                children: [
                                  Text(
                                    data.name!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    data.price!,
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
                                          _controller.addproduct(data);
                                          // ref
                                          //     .read(shopCartProvider.notifier)
                                          //     .addToCart(products[index]);
                                        },
                                        title: "Add to Cart",
                                        color: _controller.productmodel
                                                .contains(data)
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

// class ShopProductsTile extends HookConsumerWidget {
//   ShopProductsTile({
//     Key? key,
//   }) : super(key: key);


// }
