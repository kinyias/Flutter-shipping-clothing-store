import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CHelperFunctions {
  static Color getColor(String value) {
    // Tạo một Map ánh xạ màu
    final colorMap = {
      'Green': Colors.green,
      'Red': Colors.red,
      'Blue': Colors.blue,
      'Pink': Colors.pink,
      'Grey': Colors.grey,
      'Purple': Colors.purple,
      'Black': Colors.black,
    };

    // Trả về màu tương ứng hoặc màu mặc định nếu không tìm thấy
    return colorMap[value] ?? Colors.transparent;
  }

  // Hiển thị SnackBar
  static void showSnackBar(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    Get.snackbar(
      'Thông báo',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      backgroundColor: Colors.black.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  // Hiển thị AlertDialog
  static void showAlert(String title, String message) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      buttonColor: Colors.blue,
      onConfirm: () => Get.back(),
    );
  }

  // Điều hướng sang màn hình mới
  static void navigateToScreen(Widget screen) {
    Get.to(() => screen);
  }

  // Cắt bớt văn bản nếu quá dài
  static String truncateText(String text, int maxLength) {
    if (maxLength <= 0) return ''; // Xử lý trường hợp maxLength không hợp lệ
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}...';
  }

  // Kiểm tra chế độ tối
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget>widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i =0; i< widgets.length; i+=rowSize){
      final rowChildren = widgets.sublist(i, i+rowSize>widgets.length? widgets.length : i+rowSize);
      wrappedList.add(Row(children: rowChildren,));
    }
    return wrappedList;
  }
}
