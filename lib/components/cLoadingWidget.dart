import 'package:flutter/material.dart';
import '../constants/color_constant.dart';
import '../utils/display_utils.dart';
import 'cText_Style.dart';

class IsLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
                color: cPrimeryColor2, strokeWidth: 2)),
        hGap(10),
        Text(
          "Loading...",
          style: TextStyles.getSubTita16(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              textColor: cPrimeryColor2),
        ),
      ],
    );
  }
}
