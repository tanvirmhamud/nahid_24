import 'package:nahid_24/domain/course/course_model.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/function/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ClassScreen extends HookWidget {
  final CourseModel course;
  const ClassScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController youtubePlayerController =
        useMemoized(() => YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(course.url)!,
              flags: YoutubePlayerFlags(
                // mute: false,
                loop: false,
                autoPlay: false,
              ),
            ));
    useEffect(() {
      return () => youtubePlayerController.dispose();
    }, []);
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: youtubePlayerController),
        builder: (context, player) => Scaffold(
              backgroundColor: PColor.containerColor,
              appBar: AppBar(
                backgroundColor: PColor.containerColor,
                elevation: 0,
                leading: Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 32,
                      ));
                }),
              ),
              body: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(5),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    player,
                    Text(
                      course.title,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "1. Learn the basic",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "14 mins",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                    ),
                  ],
                ),
              ),
            ));
  }
}
