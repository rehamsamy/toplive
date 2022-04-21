import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../../../../core/constants/app_const.dart';
import '../../../data/models/room_categories.dart';
import '../../../data/remote_data_sources/home_apis.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RoomCategoriesModel?>(
      future: HomeApis().getRoomCategories(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          RoomCategoriesModel categories = snapshot.data;
          print(categories.data);
          return Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    selectedColor: ColorsManger.primary,
                    label: Text(categories.data?.elementAt(index).name ?? ""),
                    onSelected: (bool value) {},
                  ),
                );
              },
            ),
          );
        } else {
          return loading;
        }
      },
    );
  }
}
