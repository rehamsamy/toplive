import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../../core/resourses/values_manger.dart';

class DropDown extends StatelessWidget {
  const DropDown(
      {Key? key,
      this.image,
      this.hintText,
      required this.items,
      this.onChanged})
      : super(key: key);
  final String? image;
  final String? hintText;
  final List items;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          prefixIcon: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.size12),
            child: image!.startsWith("http")
                ? Image.network(
                    image.toString(),
                    width: 10,
                  )
                : Image.asset(
                    image.toString(),
                  ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        isExpanded: true,
        hint: Text(
          hintText.toString(),
          style: TextStyle(fontSize: 14),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 48,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.size12), // Border radius
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}
