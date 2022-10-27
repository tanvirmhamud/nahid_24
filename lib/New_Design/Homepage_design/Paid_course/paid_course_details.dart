import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/New_Design/Homepage_design/Paid_course/paid_course_buy.dart';
import 'package:nahid_24/constant.dart';
import 'package:provider/provider.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Provider/homepage.dart';
import '../../../utils/constants/colors.dart';

class PaidCourseDetails extends StatefulWidget {
  final String paidcourseid;
  final String couresename;
  const PaidCourseDetails(
      {super.key, required this.paidcourseid, required this.couresename});

  @override
  State<PaidCourseDetails> createState() => _PaidCourseDetailsState();
}

class _PaidCourseDetailsState extends State<PaidCourseDetails> {
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
    await provider.getpaidcoursedetails(widget.paidcourseid);
    await provider.getpaidcoursevideo(widget.paidcourseid);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=ohUQUKPaCag")!,
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
    setState(() {
      loading = false;
    });
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : YoutubePlayerBuilder(
              // onExitFullScreen: () {
              //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
              //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              // },
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
                ],
                onReady: () {
                  _isPlayerReady = true;
                },
                // onEnded: (data) {
                //   _controller
                //       .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                //   _showSnackBar('Next Video Started!');
                // },
              ),
              builder: (context, player) => Scaffold(
                appBar: AppBar(
                  backgroundColor: PColor.containerColor,
                  leading: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back))),
                  title: Text(
                    widget.couresename,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          player,
                          SizedBox(height: 10.h),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 10.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 35.r,
                                        ),
                                        SizedBox(width: 8.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              '${provider.paidCoursedetails!.data!.duration} ঘন্টা',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.groups_outlined,
                                          size: 35.r,
                                        ),
                                        SizedBox(width: 8.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        '${provider.paidCoursevideo == null ? 0 : provider.paidCoursevideo!.data!.length} টি ভিডিও ',
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
                              'কোর্স ইন্সট্রাক্টর',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            margin: EdgeInsets.all(15.r),
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white30),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 55.sp,
                                      width: 55.sp,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(45.0.sp),
                                        child:
                                            // CachedNetworkImage(
                                            //   imageUrl: icon ?? '',
                                            //   height: 50.sp,
                                            //   width: 50.sp,
                                            //   placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                                            //   fit: BoxFit.cover,
                                            //   errorWidget: (context, url, error) => Image.asset(
                                            //     'icons/ic_avatar.png',
                                            //     fit: BoxFit.cover,
                                            //   ),
                                            // ),
                                            Image.network(
                                          "$imageurl${provider.paidCoursedetails!.data!.instructorInfo!.first.image}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.paidCoursedetails!.data!
                                                .instructorInfo!.first.name!,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            provider
                                                .paidCoursedetails!
                                                .data!
                                                .instructorInfo!
                                                .first
                                                .description!,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'কোর্স সম্পর্কে বিস্তারিত ',
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white30),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "1. CCNA পরিচিতি",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "2. ওয়ার্ডপ্রেস ফর বিগিনারস",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "3. ফ্রিল্যান্সিং",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10.r),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PaidCoursebuypage(
                                              paidcourseid: widget.paidcourseid,
                                              paidCoursedetails:
                                                  provider.paidCoursedetails!,
                                            )));
                              },
                              minWidth: ScreenUtil.defaultSize.width,
                              color: PColor.containerColor,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "কোর্সটি কিনুন",
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
