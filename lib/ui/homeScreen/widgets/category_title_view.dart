import 'package:flutter/material.dart';
import 'package:spirah/core/utils/globals.dart';
import 'package:spirah/core/extensions/app_color_extension.dart';

class CategoryTitleView extends StatelessWidget {
  final String title;
  const CategoryTitleView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width:30),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: appColor.appIconColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
