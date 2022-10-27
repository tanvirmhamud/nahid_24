import 'dart:ui';

import 'package:flutter/material.dart';

import '../Http/District/district.dart';
import '../Http/Free_Course/free_course.dart';
import '../Http/Home/homepage.dart';
import '../Http/Live_Class/live_class.dart';
import '../Http/Paid_Course/paid_course.dart';
import '../Http/Quize2/quize2.dart';
import '../Http/Shop/productlist.dart';
import '../Http/Suggestion/suggestion.dart';
import '../Model/Alldistrict/alldistrict.dart';
import '../Model/Alldistrict/subdistrict.dart';
import '../Model/Book_Product/book_details.dart';
import '../Model/Free_Course/free_courese_video.dart';
import '../Model/Free_Course/free_course.dart';
import '../Model/LiveClass/liveclass.dart';
import '../Model/LiveClass/liveclass_detais.dart';
import '../Model/LiveClass/liveclassorder.dart';
import '../Model/LiveClass/liveclassvideo.dart';
import '../Model/Paid_Course/paid_course.dart';
import '../Model/Paid_Course/paid_course_details.dart';
import '../Model/Paid_Course/paid_course_order_history.dart';
import '../Model/Paid_Course/paid_course_video.dart';
import '../Model/Product/product_list.dart';
import '../Model/SubjectList/subjectlist.dart';
import '../Model/Suggestion/pdflist.dart';
import '../Model/Suggestion/suggestionlist.dart';
import '../Model/quizesubject.dart';

class HomeProvider extends ChangeNotifier {
  // subject list

  Subjectlist? subjectlist;

  Future getsubjectlist({required String apipath}) async {
    subjectlist = await HttpHomePage().subjectlist(apipath: apipath);
    notifyListeners();
  }

  // quizesubject

  List<Quizesubject>? httpQuize2;

  Future getquizesubject() async {
    httpQuize2 = await HttpQuize2().getquizelist();
    notifyListeners();
  }

  // product List

  Productlist? productlist;

  Future getproductlist() async {
    productlist = await Httpproductlist().getproductlist();
    notifyListeners();
  }

  // free course

  FreeCourse? freeCourse;

  Future getfreecourse() async {
    freeCourse = await HttpFreeCourse().getfreecourse();
    notifyListeners();
  }

  // free course video

  FreeCourseVideo? freeCourseVideo;

  Future getfreevideocourse(String categoryid) async {
    freeCourseVideo = await HttpFreeCourse().getfreecoursevideo(categoryid);
    notifyListeners();
  }

  // paid course

  PaidCourse? paidCourse;

  Future getpaidcourse() async {
    paidCourse = await HttpPAidCourse().getpaidcourse();
    notifyListeners();
  }

  PaidCoursedetails? paidCoursedetails;

  Future getpaidcoursedetails(String paidcourseid) async {
    paidCoursedetails =
        await HttpPAidCourse().getpaidcoursedetails(paidcourseid);
    notifyListeners();
  }

  PaidCoursevideo? paidCoursevideo;

  Future getpaidcoursevideo(String paidcourseid) async {
    paidCoursevideo = await HttpPAidCourse().getpaidcoursevideo(paidcourseid);
    notifyListeners();
  }

  // live class

  LiveClass? liveClass;

  Future getliveclass() async {
    liveClass = await HttpLiveClass().getliveclass();
    notifyListeners();
  }

  LiveClassdetails? liveClassdetails;

  Future getliveclassdetails(String liveclassid) async {
    liveClassdetails = await HttpLiveClass().getliveclassdetails(liveclassid);
    notifyListeners();
  }

  LiveClassvideo? liveClassvideo;

  Future getliveclassvideo(String liveclassid) async {
    liveClassvideo = await HttpLiveClass().getliveclassvideo(liveclassid);
    notifyListeners();
  }

  // suggestion

  SuggestionList? suggestionList;

  Future getsuggestin() async {
    suggestionList = await HttpSuggestion().getsuggestionlist();
    notifyListeners();
  }

  // paid course history

  PaidcourseOrderhistory? paidcourseOrderhistory;

  Future getpaidcoursehistory() async {
    paidcourseOrderhistory = await HttpPAidCourse().paidcoursehistory();
    notifyListeners();
  }

  // live class order

  Liveclassorder? liveclassorder;

  Future getliveclassorder() async {
    liveclassorder = await HttpLiveClass().getliveclassorder();
    notifyListeners();
  }

  // pdflist

  Pdflist? pdflist;

  Future getpdflist({String? topicid}) async {
    pdflist = await HttpSuggestion().getpdflist(topicid: topicid);
    notifyListeners();
  }

  // book product

  Bookproductdetaills? bookproductdetaills;

  Future getbookproductdetails(String productid) async {
    bookproductdetaills =
        await Httpproductlist().bookproductdetails(productid: productid);
    notifyListeners();
  }

  // all district

  Alldistrict? alldistrict;

  Future getalldistrict() async {
    alldistrict = await Httpdistrict().getalldistrict();
    notifyListeners();
  }

  Subdistrict? subdistrict;

  Future getsubdistrict(int districtid) async {
    subdistrict = await Httpdistrict().getsubdistrict(districtid);
    notifyListeners();
  }
}
