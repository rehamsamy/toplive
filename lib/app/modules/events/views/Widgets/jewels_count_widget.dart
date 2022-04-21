import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:flutter/material.dart';

import 'package:toplive/app/data/models/diamonds_list.dart';
import 'package:toplive/app/data/remote_data_sources/events_apis.dart';

import '../../../../../core/resourses/assets.dart';

class JewelsCountWidget extends StatelessWidget {
  const JewelsCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DiamondsListModel?>(
      future: EventsApi().getJewelsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DiamondsListModel? diamondsList = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorsManger.grey2,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                Image.asset(Assets.assetsImagesJewel, height: 30),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  diamondsList?.data?.elementAt(0).diamond.toString() ?? "00",
                  style: getMediumTextStyle(
                      fontSize: 15, color: ColorsManger.darkGrey),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.add_circle,
                  color: ColorsManger.primary,
                )
              ]),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
