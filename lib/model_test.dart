import 'package:flutter/material.dart';

class CustomModelTest extends StatefulWidget {
  const CustomModelTest({Key? key}) : super(key: key);

  @override
  State<CustomModelTest> createState() => _CustomModelTestState();
}

class _CustomModelTestState extends State<CustomModelTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("Model test"),
        ),
        body: Column(
          children: [
            CustomModelButton(),
          ],
        ),
      ),
    );
  }
}

class CustomModelButton extends StatefulWidget {
  const CustomModelButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomModelButton> createState() => _CustomModelButtonState();
}

class _CustomModelButtonState extends State<CustomModelButton> {
  var bottomSheetController;
  bool isOpen = false;
  List<String> dot = [
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
  ];

  List<String> versity = [
    "ঢাকা বিশ্ববিদ্যালয়",
    "রাজশাহী বিশ্ববিদ্যালয়",
    "চট্টগ্রাম বিশ্ববিদ্যালয়",
    "গুচ্ছ ভর্তি পরীক্ষা"
  ];
  List unit = ["ক ইউনিট", "খ ইউনিট", "গ ইউনিট", "ঘ ইউনিট"];
  int? selected;

  Color clrs = Colors.yellow;
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: versity.length,
                itemBuilder: (context, versityindex) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(0xf045de9).withOpacity(0.90),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            versity[versityindex],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 90,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 30,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 8),
                                itemCount: 4,
                                itemBuilder: (BuildContext, index) {
                                  return SizedBox(
                                    width: 150,
                                    height: 20,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selected = (versityindex * 4) + index;
                                          //  Navigator.push(context, MaterialPageRoute(builder: (_)=>Bangla1stExam()));
                                          //  _showDialog(context);
                                          isOpen = !isOpen;
                                        });
                                        if (isOpen) {
                                          bottomSheetController =
                                              showBottomSheet(
                                                  backgroundColor:
                                                      Color(0xf045de9)
                                                          .withOpacity(0.90),
                                                  context: context,
                                                  builder:
                                                      (context) => Container(
                                                            color: Colors.white,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.85,
                                                            child:
                                                                new Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              decoration:
                                                                  new BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    width: double
                                                                        .infinity,
                                                                    height: 30,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xf045de9).withOpacity(
                                                                            0.90),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "বিষয় নির্বাচন করুন",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Expanded(
                                                                    child: GridView.builder(
                                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 30, mainAxisSpacing: 8, crossAxisSpacing: 8),
                                                                        itemCount: dot.length,
                                                                        itemBuilder: (BuildContext, index) {
                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Card(
                                                                              color: Colors.white,
                                                                              elevation: 2,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                              child: Container(
                                                                                height: 5,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      dot[index],
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ));
                                          bottomSheetController.closed
                                              .then((value) {
                                            setState(() {
                                              isOpen = !isOpen;
                                            });
                                          });
                                        } else {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            isOpen = !isOpen;
                                          });
                                        }
                                      },
                                      child: Text(
                                        unit[index],
                                        style: TextStyle(
                                            color: (versityindex * 4) + index ==
                                                    selected
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          primary: (versityindex * 4) + index ==
                                                  selected
                                              ? Colors.purple.withOpacity(0.9)
                                              : Colors.white),
                                    ),
                                  );
                                })

                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //       children: [

                            //            Card(
                            //           elevation: 20,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20)
                            //           ),
                            //           child: SizedBox(
                            //             width: 150,
                            //             height: 20,
                            //             child: ElevatedButton(
                            //               onPressed: (){

                            //               },
                            //               child: Text(
                            //                 "খ ইউনিট",
                            //                 style: TextStyle(
                            //                   color: Colors.black,
                            //                   fontWeight: FontWeight.bold
                            //                 ),
                            //                 ),
                            //               style: ElevatedButton.styleFrom(
                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius: BorderRadius.circular(20),

                            //                 ),
                            //                 primary:Colors.white
                            //               ),
                            //              ),
                            //           ),
                            //         ),

                            //       ],
                            //     ),
                            //       Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //      Card(
                            //           elevation: 20,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20)
                            //           ),
                            //           child: SizedBox(
                            //             width: 150,
                            //             height: 20,
                            //             child: ElevatedButton(
                            //               onPressed: (){},
                            //               child: Text(
                            //                 "গ ইউনিট",
                            //                 style: TextStyle(
                            //                   color: Colors.black,
                            //                   fontWeight: FontWeight.bold
                            //                 ),
                            //                 ),
                            //               style: ElevatedButton.styleFrom(
                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius: BorderRadius.circular(20)
                            //                 ),
                            //                 primary: Colors.white
                            //               ),
                            //              ),
                            //           ),
                            //         ),
                            //       Card(
                            //           elevation: 20,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20)
                            //           ),
                            //           child: SizedBox(
                            //             width: 150,
                            //             height: 20,
                            //             child: ElevatedButton(
                            //               onPressed: (){},
                            //               child: Text(
                            //                 "ঘ ইউনিট",
                            //                 style: TextStyle(
                            //                   color: Colors.black,
                            //                   fontWeight: FontWeight.bold
                            //                 ),
                            //                 ),
                            //               style: ElevatedButton.styleFrom(
                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius: BorderRadius.circular(20)
                            //                 ),
                            //                 primary: Colors.white
                            //               ),
                            //              ),
                            //           ),
                            //         ),

                            //   ],
                            // ),
                            //   ],
                            // ),
                            ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }

  _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("alert"),
            content: Text("This the body of alert dialog"),
            actions: [
              TextButton(onPressed: () {}, child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          );
        });
  }
}
