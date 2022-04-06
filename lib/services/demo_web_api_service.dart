import 'package:dio/dio.dart';

class DemoWebApiService {
  final dio = Dio(
    BaseOptions(
        baseUrl: "http://192.168.1.109:58712/api",
        responseType: ResponseType.json,
        headers: {
          'Access-Control-Allow-Methods': 'HEAD, GET, POST, PUT, PATCH, DELETE',
          'content-type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }),

    // dio.options.headers['content-Type'] = 'application/json';
  );

  // Future<List<Map<dynamic, dynamic>>> getDemoList({String adi = ""}) async {
  Future<List<Map<dynamic, dynamic>>> getDemoList() async {
    var response = await dio.get("/demo/GetDnm", queryParameters: {'adi': ''});
    print(response.data.toString());
    List list = response.data;
    return list.map((e) => Map.from(e)).toList();
  }
}

class CariListesiWebApiService {
  final dio = Dio(
    BaseOptions(
        baseUrl: "http://192.168.1.109:58712/api",
        responseType: ResponseType.json,
        headers: {
          'Access-Control-Allow-Methods': 'HEAD, GET, POST, PUT, PATCH, DELETE',
          'content-type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }),

    // dio.options.headers['content-Type'] = 'application/json';
  );

  // Future<List<Map<dynamic, dynamic>>> getDemoList({String adi = ""}) async {
  Future<List<Map<dynamic, dynamic>>> getCariListesi() async {
    var response = await dio.get("/demo/GetDnm", queryParameters: {'adi': ''});
    print(response.data.toString());
    List list = response.data;
    return list.map((e) => Map.from(e)).toList();
  }
}

class CariSecWebApiService {
  final dio = Dio(
    BaseOptions(
        baseUrl: "http://192.168.1.109:58712/api",
        responseType: ResponseType.json,
        headers: {
          'Access-Control-Allow-Methods': 'HEAD, GET, POST, PUT, PATCH, DELETE',
          'content-type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }),

    // dio.options.headers['content-Type'] = 'application/json';
  );

  // Future<List<Map<dynamic, dynamic>>> getDemoList({String adi = ""}) async {
  Future<List<Map<dynamic, dynamic>>> getCariSec(String adi) async {
    var response = await dio.get("/demo/Get", queryParameters: {'adi': adi});
    print(response.data.toString());
    List list = response.data;
    return list.map((e) => Map.from(e)).toList();
  }
}

class CariKayitWebApiService {
  final dio = Dio(
    BaseOptions(
        baseUrl: "http://192.168.1.109:58712/api",
        responseType: ResponseType.json,
        headers: {
          'Access-Control-Allow-Methods': 'HEAD, GET, POST, PUT, PATCH, DELETE',
          'content-type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }),

    // dio.options.headers['content-Type'] = 'application/json';
  );

  void basicPostRequest(String adi, String soyadi, String unvani, String kodu,
      String durumu) async {
    var response = await dio.post('/demo/PostCariKayit', queryParameters: {
      'adi': adi,
      'soyadi': soyadi,
      'unvani': unvani,
      'kodu': kodu,
      'durumu': durumu
    });
    print(adi);
  }

  // Future<List<Map<dynamic, dynamic>>> getDemoList({String adi = ""}) async {
  Future<List<Map<dynamic, dynamic>>> getCariListesi() async {
    var response = await dio.get("/demo/GetDnm", queryParameters: {'adi': ''});
    print(response.data.toString());
    List list = response.data;
    return list.map((e) => Map.from(e)).toList();
  }
}
