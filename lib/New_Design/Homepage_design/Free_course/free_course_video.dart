import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Model/Free_Course/free_course.dart';
import '../../../Provider/homepage.dart';
import '../../../utils/constants/colors.dart';

class FreeCourseVideo extends StatefulWidget {
  final String categoryid;
  final Course data;
  const FreeCourseVideo(
      {super.key, required this.categoryid, required this.data});

  @override
  State<FreeCourseVideo> createState() => _FreeCourseVideoState();
}

class _FreeCourseVideoState extends State<FreeCourseVideo> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  bool loading = false;

  Future loaddata() async {
    setState(() {
      loading = true;
    });
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getfreevideocourse(widget.categoryid);
    setState(() {
      loading = false;
    });
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=ohUQUKPaCag")!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: YoutubePlayerBuilder(
                // onExitFullScreen: () {
                //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                // },
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  topActions: <Widget>[
                    SizedBox(width: 8.0.w),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  // onEnded: (data) {
                  //   _controller
                  //       .load(provider.freeCourseVideo.data.video![(provider.freeCourseVideo!.data!.video!.indexOf(data.videoId!) + 1) % provider.freeCourseVideo.data.video.length]);
                  //   _showSnackBar('Next Video Started!');
                  // },
                ),
                builder: (context, player) => Column(
                  children: [
                    player,
                    Container(
                      height: 58.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      color: PColor.containerColor,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28.r,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Flexible(
                              child: Text(
                            "1. People or institution Making",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.builder(
                      itemCount: provider.freeCourseVideo!.data!.video!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        var data = provider.freeCourseVideo!.data!.video![i];
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle,
                                color: PColor.containerColor,
                                size: 40.r,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                  child: Text(
                                "The People or institution Making",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
