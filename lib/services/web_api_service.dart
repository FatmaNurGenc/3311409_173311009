import 'package:dio/dio.dart';

class WebApiService {
  final dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.109:58712/api",
      responseType: ResponseType.json));

  Future<List<Map<dynamic, dynamic>>> getCustomerList({String adi = ""}) async {
    var response = await dio.get("/deneme");
    List list = response.data;
    return list.map((e) => Map.from(e)).toList();
  }
}
