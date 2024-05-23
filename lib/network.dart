import 'dart:convert';

import 'package:countries_flag/model.dart';
import 'package:http/http.dart' as http;

class Network{
  Model? model;
  Future<Model> getFlagesData() async{
   final response = await http.get(Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'));
   var data = jsonDecode(response.body.toString());
   if(response.statusCode == 200){
    model = Model.fromJson(data);
    return model!;
   }else{
     return model!;
   }
  }
}