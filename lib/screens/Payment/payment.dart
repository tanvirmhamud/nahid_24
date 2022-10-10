import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Http/Delivery_Charge/delivery_charge.dart';
import '../../Http/Payment/payment.dart';
import '../../Http/Shop/orderplace.dart';
import '../../domain/app/shop/place order/product_amount_model.dart';
import '../order history/order_history.dart';

class PaymentPage extends StatefulWidget {
  final String ammount;

  final List<ProductAmountModel>? orderProduct;
  const PaymentPage({Key? key, required this.ammount, this.orderProduct})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController paymentmethod = TextEditingController();
  TextEditingController yournumber = TextEditingController();
  TextEditingController trxid = TextEditingController();
  TextEditingController amount = TextEditingController();

  Future paymentrequest() async {
    HttporderPlace()
        .orderplace(orderProduct: widget.orderProduct)
        .then((value) async {
      print(value['order_id']);
      await HttpPayment()
          .paymentreq(
              district: district.text,
              upazila: division.text,
              union: address.text,
              orderid: value['order_id'],
              address: address.text,
              amount: amount.text,
              name: name.text,
              number: number.text,
              paymentnumber: yournumber.text,
              paymenttype: paymentmethod.text,
              trxid: trxid.text)
          .then((value1) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderHistory(
                        orderid: value['order_id'].toString(),
                      ))));
    });
  }

  String deliveryamount = "0";

  Future loaddata() async {
    var data = await HttpDeliveryCharge().getdeiveryCharge();
    deliveryamount = data['data']['amount'];
    setState(() {});
  }

  @override
  void initState() {
    paymentmethod.text = "Bkash";
    amount.text = widget.ammount;
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            textbox(name: "Name", hinttext: "Full name", controller: name),
            textbox(
                name: "Your Number", hinttext: "Number", controller: number),
            textbox(
                name: "Zilla/District",
                hinttext: "Zilla/District",
                controller: district),
            textbox(
                name: "Upzilla/Sub-District",
                hinttext: "Upzilla/Sub-District",
                controller: division),
            textbox(
                name: "Union/Village/Road No/House no/",
                hinttext: "Union/Village/Road No/House no/",
                controller: address),
            // textbox(
            //     name: "Address", hinttext: "Address", controller: address),

            Container(
              width: double.infinity,
              // padding: EdgeInsets.all(10),
              // decoration: BoxDecoration(color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Send money to 01787943429 personal number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                          value: "Bkash",
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey[200]),
                          items: [
                            DropdownMenuItem(
                              child: Text("Bkash"),
                              value: "Bkash",
                            ),
                            DropdownMenuItem(
                              child: Text("Nagad"),
                              value: "Nagad",
                            ),
                            DropdownMenuItem(
                              child: Text("Rocket"),
                              value: "Rocket",
                            ),
                            DropdownMenuItem(
                              child: Text("Cash on delivery"),
                              value: "Cash on delivery",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              paymentmethod.text = value.toString();
                              if (value.toString() == "Cash on delivery") {
                                trxid.text = "COD";
                              }
                            });
                          })),
                  SizedBox(height: 10),
                  if (paymentmethod.text != "Cash on delivery")
                    textbox(
                        name: "Your ${paymentmethod.text} Number",
                        hinttext: "Your Number",
                        controller: yournumber),
                  if (paymentmethod.text != "Cash on delivery")
                    textbox(
                        name: "Transaction Id",
                        hinttext: "Transaction Id",
                        controller: trxid),
                  if (paymentmethod.text != "Cash on delivery")
                    textbox(
                        name: "Amount", hinttext: "Amount", controller: amount),
                ],
              ),
            ),
            MaterialButton(
              color: Colors.indigo,
              onPressed: () {
                paymentrequest();
              },
              child: Text(
                "Request Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textbox({String? name, hinttext, TextEditingController? controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: hinttext,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}
