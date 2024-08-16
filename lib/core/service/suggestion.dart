import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/suggestion_model.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:dio/dio.dart';

Future<ResultModel> showsuggestion() async {
  Dio dio = Dio();
 // print("enter to service showsuggestion");
  Response response = await dio.get("http://localhost:8000/api/showAllSuggestions",options: Options(headers: {"Accept":"application/json"}));
  //    print( "1111Suggestion status code is"+response.statusCode.toString());
      //  print( "222Suggestion status code is"+response.data.toString());
  try {
  //  print( "3333Suggestion status code is"+response.data.toString());
    if (response.statusCode == 200) {
    
    //  print("suggeestion ::::::  "+response.data.toString());
      List<suggestionModel> listsuggestion = List.generate(
          response.data["data"].length, (index) => suggestionModel.fromMap(response.data["data"][index]));
          print(listsuggestion.toString());
      return ListofEverything(listresult: listsuggestion);
    } else {
       print("Error suggestion  "+response.data);
      return ErrorModel();
    }
  } catch (e) {
     print("Exception suggestion  "+response.data);
    return ExceptionModel();
  }
}
