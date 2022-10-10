import 'package:cached_network_image/cached_network_image.dart';
import 'package:nahid_24/application/course/course_provider.dart';
import 'package:nahid_24/screens/course/class_screen.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/function/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../youtubeplayer.dart';

class CourseInfoScreen extends HookConsumerWidget {
  final Subject subject;
  CourseInfoScreen({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(courseProvider(subject).notifier).getCourseList();
      });
      return null;
    }, []);

    //ref.read(courseProvider.notifier).hscCourseList();
    final state = ref.watch(courseProvider(subject));

    return Scaffold(
      backgroundColor: PColor.containerColor,
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        elevation: 0,
        title: Text("${state.courses.first.title}"),
      ),
      body: state.loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Container(
              margin: const EdgeInsets.all(5),
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   height: 200,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: CachedNetworkImageProvider(
                  //             subject.subject.thumbnail),
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  
                  SizedBox(height: 20),
                  if (state.courses.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            state.courses.first.title,
                            //"UI/UX Design",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add_outlined)),
                      ],
                    ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_circle_fill_outlined,
                            color: Colors.grey,
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "6 lessons",
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "14 mins",
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 237, 212, 23),
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "4.5",
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    subject.subject.subjectName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lessons",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  if (state.courses.isNotEmpty)
                    ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: state.courses.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ClassScreen(
                            //               course: state.courses[index],
                            //             )));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YoutubePlayerPage(
                                          youtubeid: state.courses[index].url,
                                        )));
                          },
                          leading: Icon(
                            Icons.play_arrow,
                            color: Colors.indigo,
                          ),
                          title: Text(
                            state.courses[index].title,
                            //"Introduce to UI/Ux",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "14 mins",
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}

