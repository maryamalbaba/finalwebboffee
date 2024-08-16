import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/report.dart';
import 'package:bofweb/core/Model/suggestion_model.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:dio/dio.dart';

Future<ResultModel> showreport() async {
  Dio dio = Dio();
  print("enter to service showreport");
  Response response = await dio.get("http://localhost:8000/api/reports",options: Options(headers: {"accept":"application/json"}));
      print( "report status code is"+response.statusCode.toString());
   
  try {
 
    if (response.statusCode == 200) {
    
     // print("report ::::::  "+response.data.toString());
      List<report> listreport = List.generate(
          response.data["data"].length, (index) => report.fromMap(response.data["data"][index]));
          print(listreport.toString());
      return ListofEverything(listresult: listreport);
    } else {
       print("Error report  "+response.data);
      return ErrorModel();
    }
  } catch (e) {
     print("Exception report  "+response.data);
    return ExceptionModel();
  }
}
