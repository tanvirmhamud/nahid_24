import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isOpen = false;
  bool isTap = false;
  bool isTap2 = false;
  bool isTap3 = false;
  bool isTap4 = false;

  var bottomSheetController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [],
          )
          //   extendBodyBehindAppBar: true,
          //   appBar: AppBar(
          //     elevation: 0,
          //     backgroundColor: Colors.purple.shade700,
          //   ),
          //   body: Column(
          //     children: [
          //       Stack(
          //         children: [
          //           Container(
          //             width: double.infinity,
          //             height: 200,
          //             decoration: BoxDecoration(
          //             color: Colors.purple.shade700,
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(40),
          //               bottomRight: Radius.circular(40),
          //                topLeft: Radius.circular(40),
          //               topRight: Radius.circular(40)
          //             )
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                  Card(
          //                 elevation: 20,
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius:BorderRadius.circular(20)
          //                   ),
          //                 child: SizedBox(
          //                   height: 30,
          //                   width: 100,
          //                   child: ElevatedButton(
          //                   onPressed: (){
          //                     setState(() {
          //                        isOpen = !isOpen;
          //                         isTap=true;

          //                     });
          //                    if (isOpen) {
          //                       bottomSheetController=_bottomSheet(context);
          //                     bottomSheetController.closed.then((value) {
          //                   setState(() {
          //                     isOpen = !isOpen;
          //                     isTap=false;
          //                   });
          //                 });
          //                 } else {
          //                   Navigator.of(context).pop();
          //                   setState(() {
          //                     isOpen =!isOpen;

          //                   });
          //                 }

          // //     } else {
          // //     Navigator.of(context).pop();
          // //     setState(() {
          // //       isOpen = !isOpen;
          // //     });
          // //   }
          // // },

          //                   },
          //                   child: Text("Sign up"),
          //                   style: ElevatedButton.styleFrom(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20),
          //                     ),
          //                     primary:isTap? Color(0xf045de9).withOpacity(0.90):Colors.green
          //                   ),
          //               ),
          //             ),
          //             ),
          //       SizedBox(height: 5,),
          //        Card(
          //           elevation: 20,
          //           shape: RoundedRectangleBorder(
          //               borderRadius:BorderRadius.circular(20)
          //             ),
          //           child: SizedBox(
          //             height: 30,
          //             width: 100,
          //             child: ElevatedButton(
          //             onPressed: (){
          //               setState(() {
          //               isOpen = !isOpen;
          //               isTap2=true;
          //               });
          //               if (isOpen) {
          //               bottomSheetController=  showBottomSheet(
          //               shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.vertical(
          //               top: Radius.circular(20),
          //              ),
          //             ),
          //             context: context,
          //             builder: (context) => Container(
          //             height: MediaQuery.of(context).size.height/1.5,
          //             child: new Container(
          //             decoration: new BoxDecoration(
          //             color: Theme.of(context).primaryColor,
          //             borderRadius: new BorderRadius.only(
          //             topLeft: const Radius.circular(20.0),
          //             topRight: const Radius.circular(20.0))),
          //             child: new Center(
          //             child: new Text("This is a modal sheet"),
          //               )),
          //            ));
          //             bottomSheetController.closed.then((value) {
          //       setState(() {
          //         isOpen = !isOpen;
          //         isTap2=false;
          //       });
          //     });
          //     } else {
          //       Navigator.of(context).pop();
          //       setState(() {
          //         isOpen =!isOpen;
          //       });
          //     }
          //     },
          //                   child: Text("Log"),
          //                   style: ElevatedButton.styleFrom(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20),
          //                     ),
          //                     primary:isTap2? Color(0xf045de9).withOpacity(0.90):Colors.green
          //                   ),
          //               ),
          //             ),
          //             ),
          //             Card(
          //                 elevation: 20,
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius:BorderRadius.circular(20)
          //                   ),
          //                 child: SizedBox(
          //                   height: 30,
          //                   width: 100,
          //                   child: ElevatedButton(
          //                   onPressed: (){
          //                     setState(() {
          //                        isOpen = !isOpen;
          //                     isTap3=true;

          //                     });
          //                    if (isOpen) {
          //                       bottomSheetController=  showBottomSheet(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.vertical(
          //         top: Radius.circular(20),
          //       ),
          //     ),
          //     context: context,
          //     builder: (context) => Container(
          //           height: MediaQuery.of(context).size.height/1.5,

          //           child: new Container(
          //               decoration: new BoxDecoration(
          //                   color: Theme.of(context).primaryColor,
          //                   borderRadius: new BorderRadius.only(
          //                       topLeft: const Radius.circular(20.0),
          //                       topRight: const Radius.circular(20.0))),
          //               child: new Center(
          //                 child: new Text("This is a modal sheet"),
          //               )),
          //         ));
          //          bottomSheetController.closed.then((value) {
          //       setState(() {
          //         isOpen = !isOpen;
          //       });
          //     });
          //     } else {
          //       Navigator.of(context).pop();
          //       setState(() {
          //         isOpen =!isOpen;
          //         isTap3=false;

          //       });
          //     }

          // //     } else {
          // //     Navigator.of(context).pop();
          // //     setState(() {
          // //       isOpen = !isOpen;
          // //     });
          // //   }
          // // },

          //                   },
          //                   child: Text("press"),
          //                   style: ElevatedButton.styleFrom(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20),
          //                     ),
          //                     primary:isTap3? Color(0xf045de9).withOpacity(0.90):Colors.green
          //                   ),
          //               ),
          //             ),
          //             ),

          //             ],
          //             ),
          //           ),
          //         ],
          //       ),

          //     ],
          //   ),
          ),
    );
  }

  _bottomSheet(BuildContext context) {
    showBottomSheet(
        backgroundColor: Color(0xf045de9).withOpacity(0.90),
        context: context,
        builder: (context) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 1.85,
              child: new Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ));
  }
}
