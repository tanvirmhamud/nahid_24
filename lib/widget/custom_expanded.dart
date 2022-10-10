import 'package:flutter/material.dart';

class CustomExpanded extends StatefulWidget {
  const CustomExpanded({
    Key? key,
    required this.title,
  }) : super(key: key);

  final List<String> title;

  @override
  State<CustomExpanded> createState() => _CustomExpandedState();
}

class _CustomExpandedState extends State<CustomExpanded> {
  int selectedCard = -1;
  List<String> title = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  color: Color(0xf045de9).withOpacity(0.90),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "বিষয় নির্বাচন করুন",
                style: TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: widget.title.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 30,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (BuildContext, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = index;
                        });
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
                          color: selectedCard == index
                              ? Colors.purple.withOpacity(0.9)
                              : Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.title[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedCard == index
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
