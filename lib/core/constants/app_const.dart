import 'package:flutter/cupertino.dart';

import '../resourses/assets.dart';

const String baseUrl = "https://dev03.matrixclouds.net/top-live/public/api/";
enum UserType {
  owner,
  visiter,
}
var backgroundBoxDectoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(Assets.assetsImagesWhiteBackground),
        fit: BoxFit.cover));
const Widget loading = Center(
  child: CupertinoActivityIndicator(),
);
Map<String, String> getRequestHeaders({
  String apiKey =
      '2Qhvx/46JXLq9dApP97tbfQqoPlwWw5CfkWdEfLUBEj7JqFHsJBh/cAmjzqUIIhLV7JWlsixLElYrTED2Tj6qQ==',
  String? contentLang = "ar",
  String? token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao",
}) {
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'x-api-key':
        '2Qhvx/46JXLq9dApP97tbfQqoPlwWw5CfkWdEfLUBEj7JqFHsJBh/cAmjzqUIIhLV7JWlsixLElYrTED2Tj6qQ==',
    'Content-Language': 'ar',
    'Authorization': 'Bearer $token'
  };
}
