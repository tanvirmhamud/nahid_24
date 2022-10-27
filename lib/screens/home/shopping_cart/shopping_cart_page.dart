import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:nahid_24/screens/home/shopping_cart/shopping_widgests/light_color.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../Http/Delivery_Charge/delivery_charge.dart';
import '../../../Http/Shop/orderplace.dart';
import '../../../Model/place order/product_amount_model.dart';
import '../../../getx/selectbtn.dart';
import '../../Payment/payment.dart';
import '../../order history/order_history.dart';
import 'shopping_widgests/data.dart';
import 'shopping_widgests/theme.dart';
import 'shopping_widgests/title_text.dart';

class ShoppingCartpage extends StatefulWidget {
  const ShoppingCartpage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartpage> createState() => _ShoppingCartpageState();
}

class _ShoppingCartpageState extends State<ShoppingCartpage> {
  final _controller = Get.put(Btncontroller());

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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderHistory(
                    orderid: value['order_id'],
                  )));
    });
  }

  String? deliveryamount;

  Future loaddata() async {
    var data = await HttpDeliveryCharge().getdeiveryCharge();
    deliveryamount = data['data']['amount'];
    print(deliveryamount);
  }

  List<ProductAmountModel> productmodel = [];

  @override
  void initState() {
    for (var i = 0; i < _controller.productmodel.length; i++) {
      productmodel.add(
          ProductAmountModel(id: _controller.productmodel[i].id!, quantity: 1));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final cartItems = ref.watch(shopCartProvider).products;
    // final orderProduct = ref.watch(
    //   shopCartProvider.select(
    //     (value) => value.products
    //         .map((e) => ProductAmountModel(id: e.id, quantity: 1))
    //         .toList(),
    //   ),
    // );

    // useEffect(() {
    //   Future.delayed(const Duration(milliseconds: 100), () async {
    //     ref
    //         .read(productOrderProvider(
    //                 ProductOrderModel(product_info: orderProduct))
    //             .notifier)
    //         .init();
    //   });
    //   return null;
    // }, []);
    // final totalItem = useState(orderProduct.length);
    // final orderAmountList = ref
    //     .watch(
    //         productOrderProvider(ProductOrderModel(product_info: orderProduct)))
    //     .products
    //     .unlock;

    // final quantityMap = orderAmountList
    //     .asMap()
    //     .map((key, value) => MapEntry(value.id, value.quantity));

    // final products = ref.watch(shopCartProvider.select((value) => value.products
    //     .asMap()
    //     .map((key, value) => MapEntry(value.id,
    //         (int.tryParse(value.price) ?? 0) * (quantityMap[value.id] ?? 1)))
    //     .values
    //     .toList()));

    // final price = productmodel.fold<int>(0, (a, b) => (a + b.quantity));

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
                          itemCount: _controller.productmodel.length,
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
                                    imageUrl:
                                        _controller.productmodel[index].photo!,
                                    fit: BoxFit.contain,
                                    errorWidget: (context, url, error) =>
                                        SizedBox.shrink(),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: TitleText(
                                      text:
                                          _controller.productmodel[index].name!,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    subtitle: Row(
                                      children: [
                                        TitleText(
                                          text: _controller
                                              .productmodel[index].price!,
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
                                              // if (orderAmountList[index]
                                              //         .quantity >
                                              //     1) {
                                              //   totalItem.value =
                                              //       totalItem.value - 1;
                                              //   ref
                                              //       .read(productOrderProvider(
                                              //               ProductOrderModel(
                                              //                   product_info:
                                              //                       orderProduct))
                                              //           .notifier)
                                              //       .decreaseProductAmount(
                                              //           index);
                                              // }
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
                                              text: "1",
                                              fontSize: 16,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // totalItem.value =
                                              //     totalItem.value + 1;
                                              // ref
                                              //     .read(productOrderProvider(
                                              //             ProductOrderModel(
                                              //                 product_info:
                                              //                     orderProduct))
                                              //         .notifier)
                                              //     .increaseProductAmount(index);
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
                              text: _controller.productmodel.length.toString() +
                                  ' Items',
                              // text: "Total",
                              color: Theme.of(context).hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            // TitleText(
                            //   text:
                            //       '${price + int.parse(snapshot.data['data']['amount'])} Taka',
                            //   fontSize: 18,
                            // ),
                          ],
                        ),
                        SizedBox(height: 30),
                        PaymentPage(
                            orderProduct: productmodel,
                            ammount:
                                "${getPrice(productmodel) + int.parse(snapshot.data['data']['amount'])}"),
                        TextButton(
                          onPressed: () {
                            // ref
                            //     .read(productOrderProvider(
                            //             ProductOrderModel(product_info: orderProduct))
                            //         .notifier)
                            //     .placeOrder();

                            // vsdv
                            // Navigator.of(context).pop();
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => OrderHistory()));
                            order(productmodel, context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                LightColor.orange),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            width: AppTheme.fullWidth(context) * .75,
                            child: TitleText(
                              text: 'Order',
                              color: LightColor.background,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
