import 'package:flutter/material.dart';

class LavelBoardPage extends StatefulWidget {
  const LavelBoardPage({Key? key}) : super(key: key);

  @override
  State<LavelBoardPage> createState() => _LavelBoardPageState();
}

class _LavelBoardPageState extends State<LavelBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 70,
                      color: Colors.green,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 250,
                      width: 70,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 150,
                      width: 70,
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text("${index + 1}"),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 25,
                        ),
                        SizedBox(width: 10),
                        Text("Kouser"),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.indigo.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text("245m"),
                        )
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
