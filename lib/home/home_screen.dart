import 'package:flutter/material.dart';
import '../home/constants.dart' show Constants, AppColors;
import 'conversation_page.dart' show ConversationPage;
import '../home/contects_page.dart' show Contects;
import '../home/discover_page.dart' show DiscoverPage;
import '../home/personal_setting.dart' show PersonalSetting;

enum AppPopItem { group_chat, add_friend, qr_scan, payment, help }

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController; //主页面控制 滑动组件
  List<Widget> _pageViews; //存放页面的集合
  int _currentIndex = 0; //记录当前页面的索引
  List<NavigationIconView> _navigationViews; //自定义导航图标数组

  void initState() {
    //初始化函数
    super.initState();

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          title: "微信",
          icon: IconData(0xe64f, fontFamily: 'appIconFont'),
          activeIcon: IconData(0xe640, fontFamily: Constants.IcontFontFamily)),
      new NavigationIconView(
          title: "通讯录",
          icon: IconData(0xe63f, fontFamily: Constants.IcontFontFamily),
          activeIcon: IconData(0xe627, fontFamily: Constants.IcontFontFamily)),
      new NavigationIconView(
          title: "发现",
          icon: IconData(0xe60b, fontFamily: Constants.IcontFontFamily),
          activeIcon: IconData(0xe603, fontFamily: Constants.IcontFontFamily)),
      new NavigationIconView(
          title: "我",
          icon: IconData(0xe602, fontFamily: Constants.IcontFontFamily),
          activeIcon: IconData(0xe607, fontFamily: Constants.IcontFontFamily)),
    ];

    _pageController = new PageController(initialPage: _currentIndex);
    _pageViews = [
      ConversationPage(),//会话页
      Contects(),//通讯录
      DiscoverPage(),//发现页面
      PersonalSetting(),//个人设置页面
    ];
  }

  //返回一个自定义组合 组件
  _buildPopMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(iconName, fontFamily: Constants.IcontFontFamily),
          size: 22.0,
          color: const Color(AppColors.AppMenuPopColor),
        ),
        Container(
          width: 12.0,
        ),
        Text(
          title,
          style: TextStyle(color: const Color(AppColors.AppMenuPopColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bnb = BottomNavigationBar(
      fixedColor: const Color(AppColors.TapIconActive), //被选中项的背景颜色
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        //elevation: 0.0,//设置没有阴影
        backgroundColor: Color(0xff303030), //背景色
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(0xe625, fontFamily: Constants.IcontFontFamily)),
            onPressed: () {
              print("点击了serch");
            },
          ),
          Container(
            width: 16.0,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<AppPopItem>>[
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe66a, "发起群聊"),
                  value: AppPopItem.group_chat,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe685, "添加朋友"),
                  value: AppPopItem.add_friend,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe62b, "扫一扫"),
                  value: AppPopItem.qr_scan,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe61e, "收付款"),
                  value: AppPopItem.payment,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe641, "帮助与反馈"),
                  value: AppPopItem.help,
                ),
              ];
            },
            icon: Icon(IconData(0xe634, //加号
                fontFamily: Constants.IcontFontFamily)),
            onSelected: (AppPopItem item) {
              //回调
              print("点击的是$item");
            },
          ),
          Container(
            width: 16.0,
          )
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pageViews[index];
        },
        controller: _pageController,
        itemCount: _pageViews.length,
        onPageChanged: (int index) {
          setState(() {
            //添加滑动页面与底端栏图标关联
            _currentIndex = index;
          });
          print("当前第$index 页");
        },
      ),
      bottomNavigationBar: _bnb,
    );
  }
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;
  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _icon = icon,
        _title = title,
        _activeIcon = activeIcon,
        item = new BottomNavigationBarItem(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              //color: Color(AppColors.TapIconNormal)
            ),
          ),
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          //icon: Icon(icon,color: Color(AppColors.TapIconNormal),),
          //activeIcon: Icon(activeIcon,color: Color(AppColors.TapIconActive),),
          //backgroundColor: Colors.white
        );
}
