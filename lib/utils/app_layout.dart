import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static Size getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(){
    return Get.height;
  }

  static getScreenWidth(){
    return Get.width;
  }

  static getHeight(double pixels){
    double x = getScreenHeight()/pixels; //800/200 =>4.22
    return getScreenHeight()/x; //800/4.22 => 189.57
  }

  static getWidth(double pixels){
    double x = getScreenWidth()/pixels;
    return getScreenWidth()/x;
  }

}