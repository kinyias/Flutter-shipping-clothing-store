import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CSizes.appBarHeight,
    left: CSizes.defaultSpace,
    bottom: CSizes.defaultSpace,
    right: CSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithoutAppBarHeight = EdgeInsets.only(
    top: 20,
    left: CSizes.defaultSpace,
    bottom: CSizes.defaultSpace,
    right: CSizes.defaultSpace,
  );
}
