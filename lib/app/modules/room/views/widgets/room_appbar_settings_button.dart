import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';

import '../../../../../core/resourses/assets.dart';

class RoomActions extends StatefulWidget {
  const RoomActions({Key? key}) : super(key: key);

  @override
  State<RoomActions> createState() => _RoomActionsState();
}

class _RoomActionsState extends State<RoomActions> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: DropdownButton2(
          customButton: const Icon(
            Icons.more_horiz,
            size: 20,
            color: ColorsManger.grey1,
          ),
          customItemsIndexes: const [4],
          customItemsHeight: 8,
          items: [
            ...MenuItems.firstItems.map(
              (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
          ],
          onChanged: (value) {
            MenuItems.onChanged(context, value as MenuItem);
          },
          itemHeight: 35,
          itemPadding: const EdgeInsets.only(left: 16, right: 16),
          dropdownWidth: 150,
          dropdownPadding: const EdgeInsets.symmetric(vertical: 12),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black54,
          ),
          dropdownElevation: 8,
          offset: const Offset(0, 8),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final String icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [upgrade, theme, settings, logout];

  static const upgrade =
      MenuItem(text: 'Upgrade room', icon: Assets.assetsImagesUpgradeRoom);
  static const theme =
      MenuItem(text: 'Change theme', icon: Assets.assetsImagesRoomTheme);
  static const settings =
      MenuItem(text: 'Lock room', icon: Assets.assetsImagesLockRoom);
  static const logout =
      MenuItem(text: 'Log Out', icon: Assets.assetsImagesShareRoom);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Image.asset(item.icon, color: Colors.white, height: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: getMediumTextStyle(color: Colors.white),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.upgrade:
        //Do something
        break;

      case MenuItems.theme:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
