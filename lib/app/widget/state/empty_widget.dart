/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-26 10:21:37
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 11:35:33
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/utils/object_util.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String desc;
  final Widget? image;

  EmptyWidget({
    this.title = '',
    this.desc = '',
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        image ?? SizedBox(),
        isEmpty(title)
            ? SizedBox()
            : Text(
                title,
                style: TextStyle(fontSize: 14, color: const Color(0xFF707070)),
                textAlign: TextAlign.center,
              ),
        SizedBox(height: 5),
        isEmpty(desc)
            ? SizedBox()
            : Text(
                desc,
                style: TextStyle(fontSize: 14, color: const Color(0xff97A4B3)),
                textAlign: TextAlign.center,
              ),
      ],
    );
  }
}
