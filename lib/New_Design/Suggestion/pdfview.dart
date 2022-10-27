import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewPage extends StatefulWidget {
  final PDFDocument pdfDocument;
  const PdfViewPage({Key? key, required this.pdfDocument}) : super(key: key);

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PDFViewer(
                
               
                document: widget.pdfDocument,
                zoomSteps: 1,
                minScale: 0.5,
                maxScale: 4,
                
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
    );
  }
}
