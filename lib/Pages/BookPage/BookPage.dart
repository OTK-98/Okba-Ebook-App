import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../Controller/PdfController.dart';

class BookPage extends StatelessWidget {
  final String bookUrl;
  final String bookName;

  const BookPage({super.key, required this.bookUrl, required this.bookName});

  @override
  Widget build(BuildContext context) {
    PdfController pdfController = Get.put(PdfController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            bookName,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pdfController.pdfViewerKey.currentState?.openBookmarkView();
          },
          child: Icon(
            Icons.bookmark,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        body: SfPdfViewer.network(
          bookUrl,
          key: pdfController.pdfViewerKey,
        ),
      ),
    );
  }
}
