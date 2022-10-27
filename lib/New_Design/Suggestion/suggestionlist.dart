import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/New_Design/Suggestion/pdflist.dart';
import 'package:nahid_24/Provider/homepage.dart';
import 'package:nahid_24/Route/push.dart';
import 'package:provider/provider.dart';

class SuggestionListpage extends StatefulWidget {
  const SuggestionListpage({Key? key}) : super(key: key);

  @override
  State<SuggestionListpage> createState() => _SuggestionListpageState();
}

class _SuggestionListpageState extends State<SuggestionListpage> {
  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getsuggestin();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10.r),
              shrinkWrap: true,
              itemCount: provider.suggestionList!.data!.length,
              itemBuilder: ((context, index) {
                var data2 = provider.suggestionList!.data![index];
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data2.name!,
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF0056DA),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data2.topic!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 6.0,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: ((context, index2) {
                          var data = data2.topic![index2];

                          return InkWell(
                              onTap: () {
                                newscreen(PdfList(topicid: data.id.toString()),
                                    context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[400]!),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  data.name!,
                                  textAlign: TextAlign.center,
                                ),
                              ));
                        }))
                  ],
                );
              }),
            ),
    );
  }
}
