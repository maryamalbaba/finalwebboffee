import 'package:bofweb/core/Model/Detail_model.dart';
import 'package:bofweb/core/Model/book_model.dart';
import 'package:bofweb/core/config/options.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract class BookService {
  Dio dio = Dio();

  getType(String id) {
    dio.get("${BaseUrl}books/type/${id}");
  }

  late Response response;
  Future<List<DetailModel>> getAllBook(String id);
  Future<BookModel> getOneBook();
  createBook(BookModel);
  DeleteBook(num id);
}

class ServiceImmpl extends BookService {
  @override
  DeleteBook(num id) {
    // TODO: implement DeleteBook
    throw UnimplementedError();
  }

  @override
  createBook(BookModel) {
    // TODO: implement createBook
    throw UnimplementedError();
  }

  @override
  Future<List<DetailModel>> getAllBook(String id) async {
    try {
      response = await dio.get('${BaseUrl}books/type/${id}', options: Options(headers: getoptions2()));
      print(" book response "+response.toString());
      if (response.statusCode == 200) {
        List<DetailModel> book_model = List.generate(
            response.data['data'].length,
            (index) => DetailModel.fromMap(response.data['data'][index]));



          //! edit
  List<dynamic> inside_books = response.data['data'];

    // Iterate through each post and store the id in shared preferences
    for (int i = 0; i < inside_books.length; i++) {
      int id = inside_books[i]['id'];
      // Store the id in shared preferences
      print( "*****${getIt<SharedPreferences>().setInt('id',id).toString()}");
      await getIt<SharedPreferences>().setInt('id',id);
    }


          //!
       print("List of book"+response.toString());
        return book_model;
      } else {
        print("no response in get allbook maya");
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<BookModel> getOneBook() {
    // TODO: implement getOneBook
    throw UnimplementedError();
  }
}
