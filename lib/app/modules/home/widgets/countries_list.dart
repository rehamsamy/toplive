import 'package:flutter/material.dart';

import '../../../../core/resourses/styles_manger.dart';
import '../../../../core/resourses/values_manger.dart';
import '../../../data/models/all_countries.dart';
import '../../../data/remote_data_sources/home_apis.dart';

class AllCountriesList extends StatelessWidget {
  const AllCountriesList({Key? key, this.itemsCount = 3}) : super(key: key);
  final int itemsCount;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllCountriesModel?>(
      future: HomeApis().getAllCountries(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          AllCountriesModel? countries = snapshot.data;
          return Container(
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: itemsCount,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    //height: 30,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.size4),
                            child: Image.network(
                              countries?.data?.elementAt(index).flag ?? "",
                              height: 30,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          countries?.data?.elementAt(index).name ?? "",
                          style: getMediumTextStyle(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center();
      },
    );
  }
}
