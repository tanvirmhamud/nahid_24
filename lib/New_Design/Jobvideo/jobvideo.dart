import 'package:flutter/material.dart';
import 'package:nahid_24/Http/Job_Video/jobvideo.dart';

import '../../Model/allcource.dart';
import '../../youtubeplayer.dart';

class JobVideoPage extends StatefulWidget {
  const JobVideoPage({Key? key}) : super(key: key);

  @override
  State<JobVideoPage> createState() => _JobVideoPageState();
}

class _JobVideoPageState extends State<JobVideoPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Allcource?>(
      future: HttpJobVideo().getjobvideo(),
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
    }));
  }
}
