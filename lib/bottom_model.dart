import 'package:flutter/cupertino.dart';

class BottomModel {
  String name;
  Widget? imageWidget;
  int id;
  bool selected;
  int? sortId;

  BottomModel(
      {required this.name,
      this.imageWidget,
      required this.id,
      this.selected = false,
      this.sortId = 0});
}
