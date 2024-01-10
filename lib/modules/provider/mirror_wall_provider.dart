import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/modules/model/mirror_model.dart';
import 'package:mirror_wall_app/modules/utils/global_lists.dart';

class mirrorwallprovider extends ChangeNotifier {
  late InAppWebViewController _webViewController;
  List<mirrormodel> mirrorlist = [];

  List<Bookmark> bookmarks = [];

  TextControllerModel textControllerModel = TextControllerModel(
    titleTxt: TextEditingController(text: ""),
  );

  void WebViewController(InAppWebViewController controller) {
    _webViewController = controller;
  }

  getData() {
    mirrorlist = mirrorlistdata.map((e) {
      return mirrormodel(name: e['name'], img: e['img'], link: e['link']);
    }).toList();
    notifyListeners();
  }

  void addbookmark(String url) {
    bookmarks.add(Bookmark(title: textControllerModel.titleTxt.text, url: url));
    notifyListeners();
    textControllerModel.titleTxt.clear();
  }

  void setWebViewController(InAppWebViewController controller) {
    _webViewController = controller;
  }

  void reloadWeb() {
    if (_webViewController != null) {
      _webViewController.reload();
    }
  }

  void goBack() {
    if (_webViewController != null) {
      _webViewController.goBack();
    }
  }

  void goHome(String url) {
    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: WebUri(url),
      ),
    );
  }

  void goForward() {
    if (_webViewController != null) {
      _webViewController.goForward();
    }
  }
}

class mirrorprovider extends ChangeNotifier {
  List<mirrorwallmodel> mirrorwalllist = [];

  getData() {
    mirrorwalllist = mirrorwalllistdata.map((e) {
      return mirrorwallmodel(
          names: e['names'], image: e['image'], links: e['links']);
    }).toList();
    notifyListeners();
  }
}

class mirrorbrowsers extends ChangeNotifier {
  List<mirrorbrowsersmodel> mirrorwallbrowsers = [];

  getData() {
    mirrorwallbrowsers = browsers.map((e) {
      return mirrorbrowsersmodel(
          namee: e['namee'], imag: e['imag'], linkss: e['linkss']);
    }).toList();
  }
}
