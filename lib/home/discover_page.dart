import 'package:flutter/material.dart';
import '../home/full_Width_Button.dart' show FullWidthIconButton;
import '../home/constants.dart' show AppColors,Constants;

class DiscoverPage extends StatefulWidget {
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //他会把所有的条目都渲染出来
      child: Container(
        color: Color(AppColors.AppBackColor),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: Constants.BoxSeparate_SIZE,
            // ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_social_circle.png',
              title: '朋友圈',
              onPressed: () {},
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: '扫一扫',
              showDivider: true,
              onPressed: () {
                print("点击了扫一扫");
              },
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_shake_phone.png',
              title: '摇一摇',
              onPressed: () {
                print("点击了摇一摇");
              },
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_feeds.png',
              title: '看一看',
              showDivider: true,
              onPressed: () {
                print("点击了看一看");
              },
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_quick_search.png',
              title: '搜一搜',
              onPressed: () {
                print("点击了搜一搜");
              },
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: '附近人',
              showDivider: true,
              onPressed: () {
                print("点击了附近人");
              },
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: '漂流瓶',
              onPressed: () {
                print("点击了漂流瓶");
              },
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_shopping.png',
              title: '购物',
              showDivider: true,
              onPressed: () {
                print("点击了购物");
              },
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_wx_games.png',
              title: '游戏',
              onPressed: () {
                print("点击了游戏");
              },
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_mini_program.png',
              title: '小程序',
              onPressed: () {
                print("点击了小程序");
              },
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
          ],
        ),
      ),
    );
  }
}
