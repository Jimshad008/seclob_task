import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seclob_task/model/media_model.dart';
import 'package:http/http.dart' as http;
final homeRepositoryProvider=Provider((ref) => HomeRepository());
class HomeRepository{
  HomeRepository();
  Future<List<MediaModel>>fetchData() async {
    List<MediaModel> medias=[];
    String url = "https://rubidya.com/api/users/get-media";

    // Token
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I";

    // Headers with Authorization
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      Map<String,dynamic>data = json.decode(response.body);
      for(var i in data["media"]){
        medias.add(MediaModel.fromMap(i));
      }
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(data);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    } else {
      throw Exception('Failed to load data');
    }
    return medias;
  }
}