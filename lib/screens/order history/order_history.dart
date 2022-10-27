import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:intl/intl.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/function/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../Http/Shop/orderlist.dart';
import '../../Model/Getmyorder/gtmyorder.dart';
import '../Payment/payment.dart';

class OrderHistory extends StatefulWidget {
  final String orderid;
  const OrderHistory({Key? key, required this.orderid}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Future loadpoup() async {}

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title:
            'Thank you. Your order has been received. Your order id is ${widget.orderid}',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.containerColor,
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                FutureBuilder<Getnyorder?>(
                    future: HttpOrder().getorder(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 20),
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            var orders = snapshot.data!.data!;
                            return Container(
                              padding: EdgeInsets.all(13),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(orders[index].createdAt!),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '৳' + orders[index].totalBill!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Column(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Text(
                                      //       "HR Home kitchen",
                                      //     ),
                                      //     Text(
                                      //       "House 14,mohammadpur,dhaka",
                                      //     ),
                                      //   ],
                                      // ),
                                      Text(
                                        "Current status: " +
                                            orders[index].status!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/images/a.jpg"),
                                      )
                                    ],
                                  ),
                                  // Divider(),
                                  // Text(
                                  //   "পুনরায় অর্ডার করুন",
                                  //   style: TextStyle(color: Colors.redAccent),
                                  // )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
              ],
            )),
      ),
    );
  }
}
