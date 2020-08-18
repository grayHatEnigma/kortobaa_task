import 'package:flutter/material.dart';

// I made this class to help build responsive apps
// I use it along with some vs code snippets I made
// To increase my speed and keep my apps as responsive as possible

class SizeUtil {
  factory SizeUtil() => _singleton;
  static final SizeUtil _singleton = SizeUtil._();
  SizeUtil._();

  // Device screen size
  double _screenHeight;
  double _screenWidth;
  double get screenHeight => _screenHeight;
  double get screenWidth => _screenWidth;

  // This is the screen size you develop / design on (i.e : emulator)
  final double _refrenceScreenHeight = 683.4285714285714;
  final double _refrenceScreenWidth = 411.42857142857144;
  // in my case I implement my UIs on a Pixel 2

  // You should call this after you get the first MaterialApp 'context'
  void updateScreenDimensions({double width, double height}) {
    // print('Ref. Height : $height , Ref. Width : $width');
    _screenWidth = (width != null) ? width : _screenWidth;
    _screenHeight = (height != null) ? height : _screenHeight;
  }

  // Helpers
  double height(double height) {
    if (_screenHeight == null) return height;
    return _screenHeight * height / _refrenceScreenHeight;
  }

  double width(double width) {
    if (_screenWidth == null) return width;
    var w = _screenWidth * width / _refrenceScreenWidth;

    return w.ceilToDouble();
  }

  double size(double size) {
    if (_screenWidth == null) return size;
    var s = _screenWidth * size / _refrenceScreenWidth;

    return s.ceilToDouble();
  }

  // Size Boxes
  Widget sizedBoxWithWidth(double w) => SizedBox(
        width: width(w),
      );
  Widget sizedBoxWithHeight(double h) => SizedBox(
        height: height(h),
      );
}
