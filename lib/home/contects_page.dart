import 'package:flutter/material.dart';
import '../modle/contects.dart' show Contect, ContectPageData;
import '../home/constants.dart' show Constants, AppColors, AppStytle;

//通讯录列表item
class _ContectItem extends StatelessWidget {
  _ContectItem(
      {@required this.avatar,
      @required this.title,
      this.groupTitle,
      this.onPressed});

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  static const double MARGIN_VERTICAL = 10.0; //item上下的间距
  static const double GROUP_TITLE_HEIGHT = 24.0; //字母item的高度
  //判断是否来自网络地址
  bool get isAvatarFromNet {
    if (avatar.startsWith("http") || avatar.startsWith("https")) {
      return true;
    }
    return false;
  }

  //计算item的高度
  static double _height(bool hasGroupTitle) {
    final double _buttonHeight = MARGIN_VERTICAL * 2 +
        Constants.ContectItemAvatarSize +
        Constants.DividerWidth;
    if (hasGroupTitle) {
      return _buttonHeight + GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
  }

  @override
  Widget build(BuildContext context) {
    Widget avatarImg;
    if (isAvatarFromNet) {
      avatarImg = Image.network(
        avatar,
        width: Constants.ContectItemAvatarSize,
        height: Constants.ContectItemAvatarSize,
      );
    } else {
      avatarImg = Image.asset(
        avatar,
        width: Constants.ContectItemAvatarSize,
        height: Constants.ContectItemAvatarSize,
      );
    }

    Widget _button = Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // symmetric 对称
        padding: const EdgeInsets.symmetric(vertical: MARGIN_VERTICAL), //对称
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: Constants.DividerWidth,
                    color: Color(AppColors.DividerColor)))),
        child: Row(
          children: <Widget>[
            avatarImg,
            SizedBox(
              width: 10.0,
            ),
            Text(title),
          ],
        ));
    //按字母分组  分组标签
    Widget itemBody;
    if (groupTitle != null) {
      itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            color: Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(groupTitle, style: AppStytle.GroupTitleItemTextStyle),
          ),
          _button
        ],
      );
    } else {
      itemBody = _button;
    }

    return itemBody;
  }
}

//通讯录
class Contects extends StatefulWidget {
  Color _indexBarColor = Colors.transparent;
  String _currentLetter = '';
  _ContectsState createState() => _ContectsState();
}

const INDEX_BAR_WORDS = [
  '↑',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

class _ContectsState extends State<Contects> {
  ScrollController _scrollController;
  final ContectPageData data = ContectPageData.contectPageData();
  final List<Contect> contects = [];
  final List<_ContectItem> functionButton = [
    _ContectItem(
      avatar: "assets/images/ic_new_friend.png",
      title: "新朋友",
      onPressed: () {
        print("添加新朋友");
      },
    ),
    _ContectItem(
      avatar: "assets/images/ic_group_chat.png",
      title: "群聊",
      onPressed: () {
        print("群聊");
      },
    ),
    _ContectItem(
      avatar: "assets/images/ic_tag.png",
      title: "标签",
      onPressed: () {
        print("标签");
      },
    ),
    _ContectItem(
      avatar: "assets/images/ic_public_account.png",
      title: "公众号",
      onPressed: () {
        print("公众号");
      },
    ),
  ];

  final Map _letterProMap = {INDEX_BAR_WORDS[0]: 0.0};

  @override
  void initState() {
    super.initState();
    contects
      ..addAll(data.contectList) //链式调用
      ..addAll(data.contectList)
      ..addAll(data.contectList)
      ..addAll(data.contectList);
    contects.sort((Contect a, Contect b) => a.nameIndex.compareTo(b.nameIndex));
    _scrollController = new ScrollController();
    //计算用于 indexBar 进行定位的关键通讯录列表项的位置
    var _totalPos = functionButton.length * _ContectItem._height(false);
    for (int i = 0; i < contects.length; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          contects[i].nameIndex.compareTo(contects[i - 1].nameIndex) == 0) {
        _hasGroupTitle = false;
      }
      if (_hasGroupTitle) {
        _letterProMap[contects[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContectItem._height(_hasGroupTitle);
    }
  }

  String _getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPos);
    //clamp 限定区间
    int index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if (_letterProMap.isNotEmpty) {
      final _pos = _letterProMap[letter];
      if (_pos != null) {
        _scrollController.animateTo(_pos,
            curve: Curves.easeOut, duration: Duration(milliseconds: 200));
      }
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();
    //控件的最大的高度
    final double _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letters.length;
    return GestureDetector(
      //手势
      onVerticalDragDown: (DragDownDetails details) {
        //点下触发
        setState(() {
          widget._indexBarColor = Colors.black26;
          widget._currentLetter =
              _getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      onVerticalDragEnd: (DragEndDetails dragEndDetails) {
        //滑动松开触发
        setState(() {
          widget._indexBarColor = Colors.transparent;
          widget._currentLetter = null;
        });
      },
      onVerticalDragCancel: () {
        //点下抬起触发
        setState(() {
          widget._indexBarColor = Colors.transparent;
          widget._currentLetter = null;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          widget._indexBarColor = Colors.black26;
          widget._currentLetter =
              _getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      child: Column(
        children: _letters,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); //销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _body = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index < functionButton.length) {
            return functionButton[index];
          }
          int dataIndex = index - functionButton.length;
          Contect temp = contects[dataIndex];
          bool isGroupTitle = true;
          if (dataIndex >= 1 &&
              temp.nameIndex == contects[dataIndex - 1].nameIndex) {
            isGroupTitle = false;
          }

          return _ContectItem(
            avatar: temp.avatar,
            title: temp.name,
            groupTitle: isGroupTitle ? temp.nameIndex : null,
          );
        },
        itemCount: contects.length,
      ),
      Positioned(
        //指定位置
        width: 32.0,
        top: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: Container(
            color: widget._indexBarColor,
            child: LayoutBuilder(
              builder: _buildIndexBar,
            )),
      )
    ];

    if (widget._currentLetter != null && widget._currentLetter.isNotEmpty) {
      _body.add(Container(
        alignment: Alignment.center,
        //中间要显示的字母
        width: Constants.IndexLetterBoxSize,
        height: Constants.IndexLetterBoxSize,
        decoration: BoxDecoration(
            color: AppColors.IndexLetterBoxBg,
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.IndexLetterBoxRadiu))),
        child: Container(
          child: Text(
            widget._currentLetter,
            style: AppStytle.IndexLetterBoxTextStyle,
          ),
        ),
      ));
    }

    return Stack(
      alignment: Alignment.center,
      children: _body,
    );
  }
}
