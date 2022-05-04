import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/services/chat/room_chat.dart';
import '../../controllers/room_controller.dart';
import 'package:flutter/material.dart';

class RoomMessages extends GetWidget<RoomController> {
  const RoomMessages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: StreamBuilder(
        stream:
            RoomChatService().getChatStream(controller.room.id.toString(), 50),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var messages = snapshot.data.docs;
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: messages.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FadeInUp(
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManger.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(AppSize.size12),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManger.black.withOpacity(.2),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  messages[index]['image'],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      messages[index]['name'] ?? "no name",
                                      style: getLightTextStyle(
                                        color: ColorsManger.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      messages[index].data()['message'],
                                      style: getMediumTextStyle(
                                        color: ColorsManger.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return loading;
          }
        },
      ),
    );
  }
}
