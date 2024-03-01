import 'package:flutter/material.dart';

class SelectedFeatureModel {
  SelectedFeatureModel(
      {required this.featureId,
      required this.roomId,
      required this.checkBox,
      required this.descrptionController,
      required this.images});
  int roomId;
  int featureId;
  bool checkBox;
  TextEditingController descrptionController;
  List<String> images;
}
