import 'package:flutter/cupertino.dart';

class mirrormodel {
  String name;
  String link;
  String img;
  mirrormodel({required this.name, required this.img, required this.link});
}

class mirrorwallmodel {
  String names;
  String links;
  String image;
  mirrorwallmodel(
      {required this.names, required this.image, required this.links});
}

class Bookmark {
  String title;
  String url;

  Bookmark({required this.title, required this.url});
}

class TextControllerModel {
  TextEditingController titleTxt = TextEditingController();
  TextControllerModel({required this.titleTxt});
}

class mirrorbrowsersmodel {
  String namee;
  String linkss;
  String imag;
  mirrorbrowsersmodel(
      {required this.namee, required this.imag, required this.linkss});
}
