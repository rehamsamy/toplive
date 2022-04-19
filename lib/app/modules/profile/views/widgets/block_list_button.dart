import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';
class BlockListButton extends StatelessWidget {
  const BlockListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManger.white,
          borderRadius: BorderRadius.circular(AppSize.size12)
      ),
      child: ListTile(

        title: Text("Block list",style: getBoldTextStyle(color: ColorsManger.error,fontSize: 18 ), ),
        leading: Icon(Icons.block,color: ColorsManger.error, ),
        trailing: Icon(Icons.arrow_forward_ios_outlined,color: ColorsManger.error, ),
      ),
    );
  }
}
