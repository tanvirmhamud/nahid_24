import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/constants/colors.dart';
import 'free_course_details.dart';

class FreeCourse extends StatefulWidget {
  const FreeCourse({super.key});

  @override
  State<FreeCourse> createState() => _FreeCourseState();
}

class _FreeCourseState extends State<FreeCourse> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
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
    // TODO: implement build
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          backgroundColor: PColor.containerColor,
          leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_back)),
          title: Text(
            'Presentation & Public Speaking',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
           SingleChildScrollView(
             child:  Column(
               children: [
                 player,
                 SizedBox(height: 10.h),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Icon(
                                 Icons.access_time,
                                 size: 35.r,
                               ),
                               SizedBox(width: 8.w),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'সময় লাগবে',
                                     style: TextStyle(
                                         color: Colors.black26,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   SizedBox(width: 6.h),
                                   Text(
                                     '২ ঘন্টা',
                                     style: TextStyle(
                                         color: Colors.black54,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w600),
                                   )
                                 ],
                               )
                             ],
                           ),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Icon(
                                 Icons.groups_outlined,
                                 size: 35.r,
                               ),
                               SizedBox(width: 8.w),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'কোর্সটি  করেছেন',
                                     style: TextStyle(
                                         color: Colors.black26,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   SizedBox(width: 6.h),
                                   Text(
                                     '৯১,২২৩ জন ',
                                     style: TextStyle(
                                         color: Colors.black54,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w600),
                                   )
                                 ],
                               )
                             ],
                           )
                         ],
                       ),
                       SizedBox(height: 10.h),
                       Divider(
                         color: Colors.black54,
                       ),
                       SizedBox(height: 10.h),
                       Row(
                         children: [
                           Icon(
                             Icons.check,
                             color: Colors.green,
                             size: 34.r,
                           ),
                           SizedBox(width: 5.w),
                           Flexible(
                             child: Text(
                               '৩১টি ভিডিও ',
                               style: TextStyle(
                                   color: Colors.black38,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.w500),
                             ),
                           )
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h),
                 Divider(
                   color: Colors.black54,
                 ),
                 SizedBox(height: 15.h),

                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10.w),
                   alignment: Alignment.centerLeft,
                   child: Text(
                     'কোর্স এ যা যা থাকবে',
                     style: TextStyle(
                         color: Colors.black54,
                         fontSize: 20.sp,
                         fontWeight: FontWeight.w700),
                   ),
                 ),
                 SizedBox(height: 2.h),
                 Container(
                   width: ScreenUtil.defaultSize.width.sw,
                   margin: EdgeInsets.all(15.r),
                   padding: EdgeInsets.all(15.r),
                   decoration:
                   BoxDecoration(borderRadius: BorderRadius.circular(6.r),border: Border.all(color: Colors.black45),color: Colors.white30),
                   child: Container(
                     decoration:
                     BoxDecoration(borderRadius: BorderRadius.circular(6.r),color: Colors.white),
                     child: Container(
                       padding: EdgeInsets.all(6.r),
                       child:    Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [Text(
                           "1. CCNA পরিচিতি",
                           style: TextStyle(
                             color: Colors.black54,
                             fontSize: 17.sp,
                             fontWeight: FontWeight.w700,
                           ),
                         ),
                           SizedBox(height: 10.h,),
                           Text(
                             "2. ওয়ার্ডপ্রেস ফর বিগিনারস",
                             style: TextStyle(
                               color: Colors.black54,
                               fontSize: 17.sp,
                               fontWeight: FontWeight.w700,
                             ),
                           ),SizedBox(height: 10.h,),
                           Text(
                             "3. ফ্রিল্যান্সিং",
                             style: TextStyle(
                               color: Colors.black54,
                               fontSize: 17.sp,
                               fontWeight: FontWeight.w700,
                             ),
                           ),],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 60.h),
               ],
             ),
           ),
            Positioned(bottom : 0,right: 0,left: 0,child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.r),
              child: MaterialButton(
                  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (_) => FreeCourseDetails()));   },
                  minWidth: ScreenUtil.defaultSize.width,
                  color: PColor.containerColor,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ))
          ],
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
