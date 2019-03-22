import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors;

enum Device {
  MAC,WINDOWS
}

//回话item数据结构
class Conversation {
  const Conversation(
      {@required this.avatar, //必须要传值得
      @required this.title,
      this.titleColor: AppColors.ConversionTitleColor,
      this.des,
      @required this.updateAt,
      this.isMute: false,
      this.unreadMsgCount: 0,
      this.displayDot: false})
      : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null); //断言

  final String avatar; //头像
  final String title; //标题
  final int titleColor; //标题的颜色
  final String des; //描述信息
  final String updateAt; //时间
  final bool isMute; //免打扰
  final int unreadMsgCount; //未读消息的数量
  final bool displayDot; //是否已小圆点的方式显示

  //判断图片地址是否来自网络
  bool isAvatarFromNet() {
    if (avatar.indexOf("http") == 0 || avatar.indexOf("https") == 0) {
      return true;
    }
    return false;
  }
}

//测试数据


//把模拟数据放到map中
/*const Map<String,List<Conversation>> conversationMockData = {
  'deviceInfo':null,
  'conversations':conversationList
};*/

class ConversationPageData{

  const ConversationPageData({this.device,this.conversations});

  final Device device;
  final List<Conversation> conversations;

  static conversationPageData(){
    return ConversationPageData(device: null,conversations: conversationList);
  }

 static const List<Conversation> conversationList = [
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '游戏描述信息',
      updateAt: '17:20',
      unreadMsgCount: 10,
      isMute: true),
  const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      titleColor: 0xff586b95,
      des: '新闻描述信息',
      updateAt: '17:12'),
  const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '描述信息',
      updateAt: '17:12'),
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      title: '美女3',
      titleColor: 0xff586b95,
      des: '描述信息',
      updateAt: '17:12'),
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      title: '美女1',
      titleColor: 0xff586b95,
      des: '描述信息',
      updateAt: '17:12'),
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/84.jpg',
      title: '美女2',
      titleColor: 0xff586b95,
      des: '描述信息',
      updateAt: '17:12'),
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/94.jpg',
      title: '帅哥',
      titleColor: 0xff586b95,
      des: '描述信息',
      updateAt: '17:12',
      isMute: true),
];
}
