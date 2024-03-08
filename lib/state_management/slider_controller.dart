import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  RangeValues sliderValue = RangeValues(20000, 50000);
  void getValue(RangeValues value) {
    sliderValue = value;
    update();
  }
}
