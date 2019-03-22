import 'package:flutter/material.dart';
import './home/constants.dart' show AppColors;
import './home/home_screen.dart';

void main() => runApp(MaterialApp(
  title: "防微信",
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
    cardColor: Color(AppColors.AppBarColor)//弹出菜单背景色
  ),
  home: HomeScreen(),
));
