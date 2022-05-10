import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/services/chat/room_chat.dart';
import '../../controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class RoomMessages extends GetWidget<RoomController> {
  const RoomMessages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .53,
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
                                    Container(
                                      width: context.width * 0.5,
                                      decoration: BoxDecoration(
                                        color:
                                            ColorsManger.black.withOpacity(.5),
                                        borderRadius: BorderRadius.circular(
                                            AppSize.size12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorsManger.black
                                                .withOpacity(.2),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (messages[index]['chat_image'] !=
                                                    null ||
                                                messages[index]['chat_image']
                                                        .toString()
                                                        .trim() !=
                                                    "")
                                              FadeIn(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.size12),
                                                  child: Image.network(
                                                    messages[index]
                                                        ['chat_image'],
                                                    fit: BoxFit.scaleDown,
                                                    errorBuilder:
                                                        (context, url, error) {
                                                      return SizedBox();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              messages[index].data()['message'],
                                              style: getMediumTextStyle(
                                                  color: ColorsManger.white,
                                                  fontSize: FontSize.medium),
                                            ),
                                            Text(
                                                messages[index]
                                                            .data()['time'] !=
                                                        null
                                                    ? timeago.format(
                                                        DateTime.fromMillisecondsSinceEpoch(
                                                            int.parse(messages[
                                                                    index]
                                                                .data()['time']
                                                                .toString())),
                                                        locale: 'en')
                                                    : "a long time ago",
                                                style: getLightTextStyle(
                                                    color: ColorsManger.grey,
                                                    fontSize: FontSize.xsmall)),
                                          ],
                                        ),
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
