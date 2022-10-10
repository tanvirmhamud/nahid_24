import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nahid_24/constant.dart';

import '../../Http/search/search.dart';
import '../../Model/search.dart';
import '../../youtubeplayer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<SearchData?>? searchget = Httpsearch().getsearchdata(key: "a");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  searchget = Httpsearch().getsearchdata(key: value);
                }
                setState(() {});
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            ),
          ),
          FutureBuilder<SearchData?>(
              future: searchget,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: ((context, index) {
                        var data = snapshot.data!.data![index];
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => YoutubePlayerPage(
                            //               youtubeid: data.url!,
                            //             ))));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            // height: 70,
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
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
              }))
        ],
      ),
    );
  }
}
