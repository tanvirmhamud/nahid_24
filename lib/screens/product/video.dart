import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("UI UX Design "),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 250,
                      child: Image.asset(
                        "assets/silder.jpg",
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50))),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Figma UI UX Design Essentials",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Created by Artur Denishavich",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("48"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.timer),
                      Text("72 Hours")
                    ],
                  ),
                  Text(
                    "\$40",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Play List",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xf045de9).withOpacity(0.90),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        child: ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            "assets/play_circle.png",
                            scale: 12,
                          ),
                          title: Text("Nahid"),
                          subtitle: Text("data"),
                          trailing: Icon(Icons.settings),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.home),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          primary: Colors.orange.withOpacity(0.7)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Enroll Now"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Colors.purple.withOpacity(0.7)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        //  floatingActionButton: Container(
        //    width: double.infinity,
        //    height: 100,
        //    color: Colors.white,
        //    child: Row(
        //      mainAxisAlignment: MainAxisAlignment.spaceAround,
        //      children: [
        //        Padding(
        //          padding: const EdgeInsets.only(left: 35),
        //          child: FloatingActionButton(
        //           onPressed: (){

        //             // _onCountPressed();
        //           },

        //           child: Icon(Icons.add),
        //           backgroundColor: Colors.orange,
        //           hoverColor: Colors.purple,
        //           tooltip: "Any text",
        //           shape: RoundedRectangleBorder(
        //           borderRadius:BorderRadius.circular(20),
        //            ),
        //          ),
        //        ),
        //          SizedBox(
        //          width: 300,
        //          child: FloatingActionButton(
        //           onPressed: (){

        //           },
        //           child: Icon(Icons.add),
        //           backgroundColor: Colors.purple,
        //           shape: RoundedRectangleBorder(
        //           borderRadius:BorderRadius.circular(25),
        //           ),
        //           ),
        //        ),
        //      ],
        //    ),
        //  ),
      ),
    );
  }
}
