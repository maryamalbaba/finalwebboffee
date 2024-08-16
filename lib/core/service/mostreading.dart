import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/book_model%20copy.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:dio/dio.dart';

Future<ResultModel> mostreading() async {
  Dio dio = Dio();
  Response response = await dio.get(BaseUrl+"mostReading");
 // print("=================++++++++++++"+response.toString());
  try {
    if (response.statusCode == 200) {
      // print("=================++++++++++++"+"200"+response.toString());
      List<Bookmodel> most_reading_List = List.generate(
          response.data["data"].length,
          (index) => Bookmodel.fromMap(response.data["data"][index]));
      return ListofEverything(listresult: most_reading_List);
    } else {
      return ErrorModel();
    }
  } catch (e) {
    print("exception in suggestion service is"+e.toString());
    return ExceptionModel();
  }
}
