import 'package:flutter/material.dart';

class Contect {
  const Contect(
      {@required this.avatar, @required this.name, @required this.nameIndex});

  final String avatar; //头像
  final String name; //名字
  final String nameIndex; //名字字母索引
}

class ContectPageData {
  static ContectPageData contectPageData(){
    return ContectPageData();
  }

  final List<Contect> contectList = [
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
        name: 'Darren',
        nameIndex: "D"),
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
        name: '孙世亮',
        nameIndex: "S"),
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/85.jpg',
        name: '刘凯',
        nameIndex: "L"),
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
        name: '曹迪',
        nameIndex: "C"),
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/72.jpg',
        name: '刘海涛',
        nameIndex: "L"),
    const Contect(
        avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
        name: '张立刚',
        nameIndex: "Z"),
  ];
}
