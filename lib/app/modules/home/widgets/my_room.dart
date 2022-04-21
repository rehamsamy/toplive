import 'package:flutter/material.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/core/resourses/color_manger.dart';

class MyRoom extends StatelessWidget {
  const MyRoom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeApis().getMyRoom(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              Container(
                color: ColorsManger.black,
                height: MediaQuery.of(context).size.height / 4,
                child: Container(
                  height: 50,
                  color: ColorsManger.white,
                  child: Column(children: [
                    Row(
                      children: [Text("data"), Icon(Icons.abc)],
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text("data"),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text("data"),
                    ),
                  ]),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
