import 'package:flutter/material.dart';

import '../../Http/allcourse.dart';
import '../../Model/allcource.dart';
import '../../constant.dart';
import '../../youtubeplayer.dart';

class AllcourceVideo extends StatefulWidget {
  const AllcourceVideo({Key? key}) : super(key: key);

  @override
  State<AllcourceVideo> createState() => _AllcourceVideoState();
}

class _AllcourceVideoState extends State<AllcourceVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cource"),
      ),
      body: FutureBuilder<Allcource?>(
          future: HttpAllcource().getallcource(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: ((context, index) {
                    var data = snapshot.data!.data![index];
                  
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => YoutubePlayerPage(
                                      youtubeid: data.url!,
                                    ))));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.indigo),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Icon(Icons.play_arrow),
                                  Image.network(data.thumbnail!),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${data.title}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${data.datumClass}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${data.subjectName}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
