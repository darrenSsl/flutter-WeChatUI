import 'package:flutter/material.dart';

//颜色
class AppColors {
   static const  AppBackColor = 0xffd1d2d2;
   static const AppBarColor = 0xff303030;
   static const TapIconActive = 0xff46c11b;
   static const TapIconNormal = 0xff999999;
   static const AppMenuPopColor = 0xffffffff;
   static const ConversionTitleColor = 0xff353535;
   static const ConversionItemBg = 0xffffffff;
   static const DesTextColor = 0xff9e9e9e;
   static const DividerColor = 0xd9d9d9;
   static const NotifyDotBg = 0xffff3e3e;
   static const NotifyDotText = 0xffffffff;
   static const ConversationMuteIconColor = 0xffd8d8d8;
   static const DeviceInfoItemBg = 0xfff5f5f5;
   static const DeviceInfoItemText = 0xff606062;
   static const DeviceInfoItemIcon = 0xff606062;
   static const ContactGroupTitleBg = 0xffebebeb;
   static const IndexLetterBoxBg = Colors.black45;
}

//定义字体样式
class AppStytle{
  static const TitleStytle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ConversionTitleColor)
  );

  static const DesTextStytle =TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.DesTextColor)
  );
  static const UnreadMsgCountDot =TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.NotifyDotText)
  );

  static const DeviceInfoItemTextStyle =TextStyle(
    fontSize:13.0,
    color:Color(AppColors.DeviceInfoItemText),
  );

  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(0xff888888)
  );
  static const IndexLetterBoxTextStyle =TextStyle(
    fontSize: 64.0,
    color: Colors.white
  );
}

//常量
class Constants {
  static const IcontFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnReadMsgNotityDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
  static const ConversationMsgNotifyDotOffset = -6.0;
  static const SizeBoxSpaceBetween = 10.0;
  static const ContainerPaddingEdgeValue = 10.0;
  static const DeviceInfoItemHeight = 32.0;
  static const ContectItemAvatarSize = 36.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 114.0;
  static const IndexLetterBoxRadiu = 4.0;
  static const BoxSeparate_SIZE = 15.0;
  static const PersonalSetingPadingLeft = 20.0;
  static const PersonalSetingPadingRight = 20.0;
  static const PersonalSetingPadingTop = 10.0;
  static const PersonalSetingPadingBottom = 10.0;
  
}