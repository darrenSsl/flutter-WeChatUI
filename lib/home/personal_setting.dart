import 'package:flutter/material.dart';
import '../home/constants.dart' show Constants, AppColors;
import '../home/full_Width_Button.dart' show FullWidthIconButton;

class PersonalSetting extends StatefulWidget {
  _PersonalSettingState createState() => _PersonalSettingState();
}

class _PersonalSettingState extends State<PersonalSetting> {
  Widget _myselfInfo = Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0, right: 20.0),
    //padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/ic_public_account.png",
          width: 64.0,
          height: 64.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "姓名",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "微信号：sunshiiang",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              )
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              "pass",
              style: TextStyle(color: Colors.transparent),
            ), //顶位置
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/images/ic_qrcode_preview_tiny.png",
                width: 24.0,
                height: 24.0,
              ),
            )
          ],
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(AppColors.AppBackColor),
        child: Column(
          children: <Widget>[
            _myselfInfo,
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_wallet.png',
              title: '支付',
              onPressed: () {},
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: '卡包',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              onPressed: () {},
            ),
            SizedBox(
              height: Constants.BoxSeparate_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              onPressed: () {},
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
