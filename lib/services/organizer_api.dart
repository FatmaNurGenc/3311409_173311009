import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:moddas_mobil_app_deneme/model/load_data.dart';

//var apiUrl = "http://192.168.1.110:64814/api/Surec/TumunuGetir";

// Future<List<SurecTakip>?> createUser(String aciklama) async{
//   final String apiUrl = "http://192.168.1.110:64814/api/Surec/MusteriEkle";

//   final response = await http.post(Uri.parse(apiUrl), body: {

//     //"name": name,
//     //"job": jobTitle
//   });

//   if(response.statusCode == 201){
//     final String responseString = response.body;
    
//     return surecTakipFromJson(responseString);
//   }else{
//     return null;
//   }
// }

Future getRequest() async {
  var response = await http.get(
    //Uri.parse("http://192.168.43.62:64814/api/Surec/TumunuGetir"), //mobil veri ip ile çalıştı
     // Uri.parse("http://localhost:64814/api/Surec/TumunuGetir"), //mobile bağlı olduğunda port hatası verdi
      Uri.parse("http://192.168.1.35:64814/api/Surec/TumunuGetir"),
      //192.168.43.62 mobil veri ip
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'content-type': 'application/json'
      });
    //   var response2 = await http.post(
    //   Uri.parse("http://192.168.1.117:64814/api/Surec/Demo?demo={demo}"),
    //   headers: {
    //     'Accept': 'application/json; charset=UTF-8',
    //     'content-type': 'application/json'
    //   },
    //   body: jsonEncode(<String, String>{
    //   'demo': "title",
    // }),
    // );

  var jsonData = jsonDecode(response.body);
  List<SurecTakip> list = [];
  for (var data in jsonData) {
    SurecTakip surecTakip = SurecTakip(
      data["ID"],
      data["Konumu"],
      DateTime.parse(data["GorusmeTarihi"]),
      data["FirmaAdi"],
      data["Yetkilisi"],
      data["Telefon"],
      data["Grubu"],
      data["Aciklama"],
      data["Durumu"],
      data["SMSHatirlatma"],
      data["SorumluKullaniciID"],
      DateTime.parse(data["pbCreateDate"]),
      DateTime.parse(data["pbUpdateDate"]),
      data["pbCreateSubeID"],
      data["pbUpdateSubeID"],
      data["pbCreateUserID"],
      data["pbUpdateUserID"],
      data["AltGrubu"],
      
    );
    
    //print(data["Konumu"]);
    list.add(surecTakip);
  }
  return list;
}

// Future postRequest(aciklama,firmaAdi) async {
  
//       var response = await http.post(
//       Uri.parse("http://192.168.1.117:64814/api/Surec/Demo?demo=demo"),
//       headers: {
//         'Accept': 'application/json; charset=UTF-8',
//         'content-type': 'application/json'
//       },
//       body: jsonEncode(<String, String>{
//       'Aciklama': aciklama,
//       'FirmaAdi': firmaAdi,
//     }),);
// print(response.statusCode);

//  //return SurecTakip.fromJson(jsonDecode(response.body));
//  return ;
// }

Future postRequest() async {
  var map = new Map<String,dynamic>();
  map['aciklama']='aciklama';
  map['firmaAdi']='firmaAdi';
  
      final response = await http.post(
      Uri.parse("http://192.168.1.35:64814/api/Surec/Demo?demo=demo"),
      // headers: {
      //   'Accept': 'application/json; charset=UTF-8',
      //   //'content-type': 'application/json'
      // },
      body: map,);
print(response.body);
print("sonnn");

 //return SurecTakip.fromJson(jsonDecode(response.body));
 //return ;
}