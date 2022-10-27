import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/New_Design/Suggestion/pdfview.dart';
import 'package:nahid_24/Provider/homepage.dart';
import 'package:nahid_24/Route/push.dart';
import 'package:provider/provider.dart';

import '../../Model/Suggestion/pdflist.dart';

class PdfList extends StatefulWidget {
  final String topicid;
  const PdfList({Key? key, required this.topicid}) : super(key: key);

  @override
  State<PdfList> createState() => _PdfListState();
}

class _PdfListState extends State<PdfList> {
  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getpdflist(topicid: widget.topicid);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    print(widget.topicid);
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf List"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: provider.pdflist!.data!.length,
              itemBuilder: ((context, index) {
                var data = provider.pdflist!.data![index];
                print("tanvir ${data}");
                return Pdfviewdata(data: data);
              })),
    );
  }
}

class Pdfviewdata extends StatefulWidget {
  final Datum data;
  const Pdfviewdata({Key? key, required this.data}) : super(key: key);

  @override
  State<Pdfviewdata> createState() => _PdfviewdataState();
}

class _PdfviewdataState extends State<Pdfviewdata> {
  bool loading = true;

  PDFDocument? pdfDocument;
  PageController pageController = PageController();

  Future loaddocumentpdf() async {
    pdfDocument = await PDFDocument.fromURL(
        "https://application.nahid24.com/${widget.data.suggestionFile}");
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddocumentpdf();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              newscreen(PdfViewPage(pdfDocument: pdfDocument!), context);
            },
            child: Container(
              height: 150.h,
              margin: EdgeInsets.all(10.r),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey),
              ),

              // child: SfPdfViewer.network(
              //     "https://application.nahid24.com/${data.suggestionFile}"),
              child: PDFViewer(
                showNavigation: false,
                showPicker: false,
                numberPickerConfirmWidget: Container(),
                showIndicator: false,

                enableSwipeNavigation: false,
                controller: pageController,
                document: pdfDocument!,
                zoomSteps: 1000,
                minScale: 0.5,
                maxScale: 4,
                backgroundColor: Colors.indigo,
                //uncomment below line to preload all pages
                // lazyLoad: false,
                // uncomment below line to scroll vertically
                // scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                /* navigationBuilder:
                            (context, page, totalPages, jumpToPage, animateToPage) {
                          return ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.first_page),
                                onPressed: () {
                                  jumpToPage()(page: 0);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  animateToPage(page: page - 2);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  animateToPage(page: page);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.last_page),
                                onPressed: () {
                                  jumpToPage(page: totalPages - 1);
                                },
                              ),
                            ],
                          );
                        }, */
              ),
            ),
          );
  }
}
