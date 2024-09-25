import 'package:flutter/material.dart';

class KYCategoryModel {
  String? id;
  String? title;
  String? color;
  // 因为数据返回的是色值，所以自定义一个颜色 widget，在数据解析时自动创建好，方便调用
  Color cColor = Colors.black;

  KYCategoryModel({this.id, this.title, this.color});

  // 字典转模型
  KYCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1.将color转成十六进制的数字
    final colorInt = int.parse(color ?? '', radix: 16);
    // 2.将透明度加进去
    cColor = Color(colorInt | 0xFF000000);
  }

  // 模型转字典
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
