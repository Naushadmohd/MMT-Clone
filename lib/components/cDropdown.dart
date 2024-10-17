import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../constants/color_constant.dart';
import '../utils/display_utils.dart';

class CDropdownButton extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value)? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final List<String>? dropdownItems;
  final String? value;
  final Color? boaderColor;
  final Widget? hintText;
  final BorderRadiusGeometry? borderRadius;
  final ValueChanged<String?>? onDropdownChanged;
  final Function(Object?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  const CDropdownButton({
    Key? key,
    this.controller,
    this.onTap,
    this.contentPadding,
    this.dropdownItems,
    required this.value,
    this.onDropdownChanged,
    required this.onChanged,
    required this.items,
    this.boaderColor,
    this.hintText,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: value!.isEmpty ? hintText : Text(value!),
            items: items,
            //value: value,
            onChanged: onChanged,
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down),
            ),
            buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                  border: Border.all(
                    color: boaderColor ?? cGrayColor,
                  ),
                  color: cPrimeryColor2,
                ),
                width: getWidth(context)),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: cPrimeryColor2),
              elevation: 8,
              offset: const Offset(0, -10),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(30),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 45,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        )
      ],
    );
  }
}
