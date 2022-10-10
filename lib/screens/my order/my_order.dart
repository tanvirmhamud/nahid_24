import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final itemList = ["1", "2", "3", "4", "5"];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
        value: item,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: double.infinity,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/a.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            "Title",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$50",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  DropdownButton<String>(
                    value: value,
                    items: itemList.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Qty : $value",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Size: L",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Color: black",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
