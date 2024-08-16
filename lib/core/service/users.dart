import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/suggestion_model.dart';
import 'package:bofweb/core/Model/users.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:dio/dio.dart';

Future<ResultModel> show_users(int id) async {
  Dio dio = Dio();
  print("enter to service showsuser");
  Response response = await dio.get(
      "http://localhost:8000/api/rater/details/${id}",
      options: Options(headers: {"accept": "application/json"}));




    print( "user status code is"+response.data.toString());
  try {
     print( "users2 status code is"+response.data.toString());
    if (response.statusCode == 200) {
       print("users ::::::  "+response.data.toString());
      List<UserModel> listsuggestion = List.generate(
          response.data["data"].length,
          (index) => UserModel.fromMap(response.data["data"][index]));
      print(listsuggestion.toString());
      return ListofEverything(listresult: listsuggestion);
    } else {
      print("Error user  " + response.data);
      return ErrorModel();
    }
  } catch (e) {
    print("Exception user  " + response.data);
    return ExceptionModel();
  }
}
