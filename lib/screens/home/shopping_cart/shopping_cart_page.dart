import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/product%20order/product_order_provider.dart';
import 'package:nahid_24/application/app/shop/shop_card_provider.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_amount_model.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_order_model.dart';
import 'package:nahid_24/screens/order%20history/order_history.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/function/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../Http/Delivery_Charge/delivery_charge.dart';
import '../../../Http/Shop/orderplace.dart';
import '../../Payment/payment.dart';
import 'shopping_widgests/data.dart';
import 'shopping_widgests/light_color.dart';
import 'shopping_widgests/theme.dart';
import 'shopping_widgests/title_text.dart';

class ShoppingCartPage extends HookConsumerWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  double getPrice(List<ProductAmountModel> orderAmountList) {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  Future order(
      List<ProductAmountModel>? orderProduct, BuildContext context) async {
    HttporderPlace().orderplace(orderProduct: orderProduct).then((value) {
      print(value['order_id']);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => OrderHistory()));
    });
  }

  String? deliveryamount;

  Future loaddata() async {
    var data = await HttpDeliveryCharge().getdeiveryCharge();
    deliveryamount = data['data']['amount'];
    print(deliveryamount);
  }

  @override
  Widget build(BuildContext context, ref) {
    final cartItems = ref.watch(shopCartProvider).products;
    final orderProduct = ref.watch(
      shopCartProvider.select(
        (value) => value.products
            .map((e) => ProductAmountModel(id: e.id, quantity: 1))
            .toList(),
      ),
    );

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () async {
        ref
            .read(productOrderProvider(
                    ProductOrderModel(product_info: orderProduct))
                .notifier)
            .init();
      });
      return null;
    }, []);
    final totalItem = useState(orderProduct.length);
    final orderAmountList = ref
        .watch(
            productOrderProvider(ProductOrderModel(product_info: orderProduct)))
        .products
        .unlock;

    final quantityMap = orderAmountList
        .asMap()
        .map((key, value) => MapEntry(value.id, value.quantity));

    final products = ref.watch(shopCartProvider.select((value) => value.products
        .asMap()
        .map((key, value) => MapEntry(value.id,
            (int.tryParse(value.price) ?? 0) * (quantityMap[value.id] ?? 1)))
        .values
        .toList()));

    final price = products.fold<int>(0, (a, b) => (a + b));

    return Scaffold(
        backgroundColor: PColor.containerColor,
        appBar: AppBar(
          backgroundColor: PColor.containerColor,
          elevation: 0,
          centerTitle: true,
          title: Text("Order"),
        ),
        body: FutureBuilder<dynamic>(
            future: HttpDeliveryCharge().getdeiveryCharge(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    padding: AppTheme.padding,
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) => Container(
                            height: 70,
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: cartItems[index].photo,
                                    fit: BoxFit.contain,
                                    errorWidget: (context, url, error) =>
                                        SizedBox.shrink(),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: TitleText(
                                      text: cartItems[index].name,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    subtitle: Row(
                                      children: [
                                        TitleText(
                                          text: cartItems[index].price,
                                          fontSize: 14,
                                        ),
                                        TitleText(
                                          text: ' Taka',
                                          color: LightColor.red,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (orderAmountList[index]
                                                      .quantity >
                                                  1) {
                                                totalItem.value =
                                                    totalItem.value - 1;
                                                ref
                                                    .read(productOrderProvider(
                                                            ProductOrderModel(
                                                                product_info:
                                                                    orderProduct))
                                                        .notifier)
                                                    .decreaseProductAmount(
                                                        index);
                                              }
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: LightColor.lightGrey
                                                    .withAlpha(150),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TitleText(
                                              text: orderAmountList[index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 16,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              totalItem.value =
                                                  totalItem.value + 1;
                                              ref
                                                  .read(productOrderProvider(
                                                          ProductOrderModel(
                                                              product_info:
                                                                  orderProduct))
                                                      .notifier)
                                                  .increaseProductAmount(index);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 70,
                        ),
                        Row(
                          children: [
                            Text("Delivery Charge"),
                            Spacer(),
                            Text(snapshot.data['data']['amount'])
                          ],
                        ),
                        //Total Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleText(
                              // text: totalItem.value.toString() + ' Items',
                              text: "Total",
                              color: Theme.of(context).hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            TitleText(
                              text:
                                  '${price + int.parse(snapshot.data['data']['amount'])} Taka',
                              fontSize: 18,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        PaymentPage(
                            orderProduct: orderProduct,
                            ammount:
                                "${price + int.parse(snapshot.data['data']['amount'])}"),
                        // TextButton(
                        //   onPressed: () {
                        //     // ref
                        //     //     .read(productOrderProvider(
                        //     //             ProductOrderModel(product_info: orderProduct))
                        //     //         .notifier)
                        //     //     .placeOrder();

                        //     // vsdv
                        //     // Navigator.of(context).pop();
                        //     // Navigator.push(context,
                        //     //     MaterialPageRoute(builder: (context) => OrderHistory()));
                        //     order(orderProduct, context);
                        //   },
                        //   style: ButtonStyle(
                        //     shape: MaterialStateProperty.all(
                        //       RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     backgroundColor: MaterialStateProperty.all<Color>(
                        //         LightColor.orange),
                        //   ),
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     padding: EdgeInsets.symmetric(vertical: 4),
                        //     width: AppTheme.fullWidth(context) * .75,
                        //     child: TitleText(
                        //       text: 'Order',
                        //       color: LightColor.background,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
