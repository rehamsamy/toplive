import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:toplive/core/resourses/values_manger.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final Function(String) onChanged;
  const SearchInput(
      {Key? key,
      required this.searchController,
      required this.hintText,
      required this.onChanged})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.size12)),
              backgroundColor: ColorsManger.primary,
            ),
            child: Icon(
              CupertinoIcons.search,
              color: ColorsManger.white,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.center,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(color: ColorsManger.grey),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.size12)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.size12)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.size12)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
