import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors, Constants;

class FullWidthIconButton extends StatelessWidget {
  static const ICON_SIZE = 24.0;
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;
  FullWidthIconButton(
      {@required this.title,
      @required this.iconPath,
      @required this.onPressed,
      this.showDivider = false})
      : assert(title != null),
        assert(iconPath != null),
        assert(onPressed != null);

  final String title;
  final String iconPath;
  final VoidCallback onPressed;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: ICON_SIZE,
          height: ICON_SIZE,
        ),
        SizedBox(
          width: HORIZONTAL_PADDING,
        ),
        Text(title)
      ],
    );
    final borderButton = Container(
      padding: EdgeInsets.only(bottom: VERTICAL_PADDING),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      child: pureButton,
    );
    return FlatButton(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: HORIZONTAL_PADDING,
          top: VERTICAL_PADDING,
          right: HORIZONTAL_PADDING,
          bottom: showDivider ? 0.0 : VERTICAL_PADDING),
      onPressed: onPressed,
      child: this.showDivider ? borderButton : pureButton,
    );
  }
}
