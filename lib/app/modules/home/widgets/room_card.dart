import 'package:animate_do/animate_do.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:toplive/app/data/models/all_rooms.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';
import 'package:flutter/material.dart';

import '../../../../core/resourses/styles_manger.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({
    Key? key,
    required this.allRooms,
  }) : super(key: key);

  final AllRoomsModel? allRooms;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .7 / 1),
      itemCount: allRooms?.data?.length ?? 0,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadeInUp(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: ColorsManger.white,
                  boxShadow: [
                    BoxShadow(
                        color: ColorsManger.black.withOpacity(.2),
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                  borderRadius: BorderRadius.circular(AppSize.size12)),
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            child: Image.network(
                              allRooms?.data?[index].roomImage ??
                                  "https://picsum.photos/200",
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                child: Icon(
                                  Icons.error,
                                  // size: 30,
                                ),
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(AppSize.size12),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GlassContainer.frostedGlass(
                              borderRadius: BorderRadius.circular(50),
                              height: 20,
                              width: 60,
                              child: Center(
                                child: Text(allRooms?.data
                                        ?.elementAt(index)
                                        .joinedUsers
                                        ?.length
                                        .toString() ??
                                    "0"),
                              ),
                            ),
                          ),
                        ),
                        if (allRooms?.data?.elementAt(index).category == null)
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassContainer.frostedGlass(
                                borderRadius: BorderRadius.circular(50),
                                height: 20,
                                width: 60,
                                child: Center(
                                  child: Text(allRooms?.data
                                          ?.elementAt(index)
                                          .category ??
                                      "0"),
                                ),
                              ),
                            ),
                          )
                        else
                          SizedBox(),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                allRooms?.data
                                        ?.elementAt(index)
                                        .roomCountry
                                        ?.flag ??
                                    "https://preview.redd.it/xfqw0pekwbg71.png?auto=webp&s=d18611777ab228e1c8ceb2ac441b1288be4d3c61",
                                fit: BoxFit.cover,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              allRooms?.data?[index].roomName ?? "No Name",
                              style: getBoldTextStyle(
                                  fontSize: 18, color: ColorsManger.black),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              allRooms?.data?[index].description ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
