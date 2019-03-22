import 'package:flutter/material.dart';
import '../home/constants.dart' show AppStytle, AppColors, Constants;
import '../modle/conversation.dart'
    show Conversation, Device, ConversationPageData;

//回话页面
class _ConversationItem extends StatelessWidget {
  final Conversation conversation;
  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //根据图片的获取方式显示头像avatar图片
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    Widget avatarContainer; //存放小红点和图片的组合容器
    if (conversation.unreadMsgCount > 0) {
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotityDotSize,
        height: Constants.UnReadMsgNotityDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(Constants.UnReadMsgNotityDotSize / 2.0),
            color: Color(AppColors.NotifyDotBg)),
        child: Text(
          conversation.unreadMsgCount.toString(),
          style: AppStytle.UnreadMsgCountDot,
        ),
      );

      avatarContainer = Stack(
        //层叠显示
        overflow: Overflow.visible, //超出偏移显示
        children: <Widget>[
          avatar,
          Positioned(
            //偏移量
            right: Constants.ConversationMsgNotifyDotOffset,
            top: Constants.ConversationMsgNotifyDotOffset,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    //最右边 添加信息的列表 正常的时间信息和勿扰模式
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStytle.DesTextStytle),
      SizedBox(
        height: 10.0,
      ), //添加一个上下的间距
    ];
    if (conversation.isMute) {
      //_rightArea.add(muteIcon);
      _rightArea.add(Icon(
        IconData(0xe6a1, fontFamily: Constants.IcontFontFamily),
        color: Color(AppColors.ConversationMuteIconColor),
        size: Constants.ConversationMuteIconSize,
      ));
    } else {
      _rightArea.add(Icon(
        IconData(0xe6a1, fontFamily: Constants.IcontFontFamily),
        color: Colors.transparent, //透明
        size: Constants.ConversationMuteIconSize,
      ));
    }

    return Container(
      padding: const EdgeInsets.all(Constants.ContainerPaddingEdgeValue),
      decoration: BoxDecoration(
          color: Color(AppColors.ConversionItemBg),
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(
            width: Constants.SizeBoxSpaceBetween,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                conversation.title,
                style: AppStytle.TitleStytle,
              ),
              Text(conversation.des, style: AppStytle.DesTextStytle),
            ],
          )),
          Container(
            width: Constants.SizeBoxSpaceBetween,
          ),
          Column(
            children: _rightArea,
          )
        ],
      ),
    );
  }
}

//回话列表顶部提示设备登录条
class _DeviceInfoItem extends StatelessWidget {
  final Device device;
  const _DeviceInfoItem({this.device})
      : assert(device != null);

  int get iconName {
    return device == Device.WINDOWS ? 0xe73e : 0xe642;
  }

  String get deviceName {
    return device == Device.WINDOWS ? "Windows" : "Mac";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.DeviceInfoItemBg),
          border: Border(
              bottom: BorderSide(
                  width: Constants.DividerWidth,
                  color: Color(AppColors.DividerColor)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(iconName, fontFamily: Constants.IcontFontFamily),
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            "$deviceName 微信已登录，手机通知已关闭",
            style: AppStytle.DeviceInfoItemTextStyle,
          ),
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final ConversationPageData data = ConversationPageData.conversationPageData();
  @override
  Widget build(BuildContext context) {
    var conversationList = data.conversations;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (data.device != null) {
          if (index == 0) {
            return _DeviceInfoItem(device: data.device,);
          }
          return _ConversationItem(
            conversation: conversationList[index - 1],
          );
        } else {
          return _ConversationItem(
            conversation: conversationList[index],
          );
        }
      },
      itemCount: data.device != null ? conversationList.length + 1 : conversationList.length,
    );
  }
}
