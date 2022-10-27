import 'package:get/get.dart';

import '../Model/Product/product_list.dart';
import '../Model/product_model.dart';
import '../Model/quize2submit.dart';
import '../Model/submitmodel.dart';


class Btncontroller extends GetxController {
  var select2ndbtn = 0.obs;

  var modelsubjectindex = 01984651465655646.obs;

  change2ndbtn(int value) {
    select2ndbtn.value = value;
  }

  selectmodelsubjectindex(int value) {
    modelsubjectindex.value = value;
  }

  var modelsubjectid = 0.obs;

  getmodelsubjectid(int id) {
    modelsubjectid.value = id;
  }

  // model question

  // var showrigthanwser = false.obs;

  // var selectanwerlist = <String>[].obs;
  // var questionid = <int>[].obs;
  // var rigthanwser = <String>[].obs;
  // var totalqurrect = <String>[].obs;

  var submitmodelques = <SubmitmodelMcq>[].obs;

  void addselectanwser(
      {String? value, int? id, String? rigthanw, SubmitmodelMcq? submitmodel}) {
    // selectanwerlist.add(value!);
    // questionid.add(id!);
    // rigthanwser.add(rigthanw!);
    // if (value == rigthanw) {
    //   totalqurrect.add(rigthanw);
    // }
    submitmodelques.add(submitmodel!);
  }

  // void showanwser() {
  //   showrigthanwser.value = true;
  // }

  void clearall() {
    // questionid.clear();
    // selectanwerlist.clear();
    // rigthanwser.clear();
    // totalqurrect.clear();
    submitmodelques.clear();
    // showrigthanwser.value = false;
    // showquizerigthanwser.value = false;
    // selectquizeanwerlist.clear();
    // quizequestionid.clear();
    // quizerigthanwser.clear();
    // quizetotalqurrect.clear();
    quize2rigthanwser.value = 0;
    quize2wronganwser.value = 0;
    quize2submitdata.clear();
    quizesubmitmodelques.clear();
    examtime.value = 5;
  }

  // exam part

  var examselectsubject = 898465456.obs;

  void getselectsubject(int value) {
    examselectsubject.value = value;
  }

  // var showquizerigthanwser = false.obs;

  // var selectquizeanwerlist = <String>[].obs;
  // var quizequestionid = <int>[].obs;
  // var quizerigthanwser = <String>[].obs;
  // var quizetotalqurrect = <String>[].obs;

  var quizesubmitmodelques = <SubmitmodelMcq>[].obs;

  void quizeaddselectanwser(
      {String? value,
      int? id,
      String? rigthanw,
      SubmitmodelMcq? submitexammodel}) {
    // selectquizeanwerlist.add(value!);
    // quizequestionid.add(id!);
    // quizerigthanwser.add(rigthanw!);
    // if (value == rigthanw) {
    //   quizetotalqurrect.add(rigthanw);
    // }
    quizesubmitmodelques.add(submitexammodel!);
  }

  // void quizeshowanwser() {
  //   showquizerigthanwser.value = true;
  // }

  // product

  var productmodel = <ProductDatum>[].obs;

  void addproduct(ProductDatum product) {
    if (productmodel.contains(product)) {
      print("product already added");
    } else {
      productmodel.add(product);
    }
  }

  // quize

  // quize 2

  var quize2submitdata = <Quize2Data>[];

  void addquize2data(Quize2Data quize2data) {
    quize2submitdata.add(quize2data);
    quize2anwseradd();
  }

  var quize2rigthanwser = 0.obs;
  var quize2wronganwser = 0.obs;

  void quize2anwseradd() {
    quize2rigthanwser.value = 0;
    quize2wronganwser.value = 0;
    for (var i = 0; i < quize2submitdata.length; i++) {
      if (quize2submitdata[i].submitAns == quize2submitdata[i].rightAns) {
        print("rigth anwser");
        quize2rigthanwser.value++;
      } else {
        print("wronmg anwser");
        quize2wronganwser.value++;
      }
    }

    // print("tanvir" + wrong.toString());
  }

  //  timer

  var examtime = 5.obs;

  void examtimechange(int time) {
    examtime.value = time;
    update();
  }

  var modeltime = 6.obs;

  void modeltimechange(int time) {
    modeltime.value = time;
    update();
  }

  var quizetime = 15.obs;
  void quizetimechange(int time) {
    quizetime.value = time;
    update();
  }
}
