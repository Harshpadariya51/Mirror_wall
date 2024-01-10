import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/modules/model/mirror_model.dart';

class search_detail_page extends StatelessWidget {
  const search_detail_page({super.key});

  @override
  Widget build(BuildContext context) {
    mirrorbrowsersmodel modelbrowsersdata =
        ModalRoute.of(context)!.settings.arguments as mirrorbrowsersmodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBC9798),
        title: Text(
          modelbrowsersdata.namee,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(modelbrowsersdata.linkss),
        ),
      ),
    );
  }
}
