import 'dart:convert';
import 'dart:io';
import 'package:bofweb/core/constants/assets_manager.dart';
import 'package:bofweb/core/constants/color.dart';
import 'package:bofweb/core/constants/components.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBook_ui extends StatefulWidget {
  AddBook_ui({super.key});

  @override
  State<AddBook_ui> createState() => _AddBook_uiState();
}

class _AddBook_uiState extends State<AddBook_ui> {
  TextEditingController Title_controller = TextEditingController();

  TextEditingController auther_name_Controller = TextEditingController();

  TextEditingController Type_Controller = TextEditingController();

  TextEditingController Totalpage_Controller = TextEditingController();

  TextEditingController Points_Controller = TextEditingController();

  TextEditingController Files_Controller = TextEditingController();

  TextEditingController description_Controller = TextEditingController();

   dynamic? image;
  final picker = ImagePicker();

  Future getimage( ImageSource source) async {
    final pickedfile = await picker.pickImage(
      source: source,
    );
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
      });
    } else {
      print("no image");
    }
  }

  Future getpdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        File pdf = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
      print("no pdf");
    }
  }

  // Future createbook(
  //     File cover,
  //     File file,
  //     String title,
  //     String author_name,
  //     String points,
  //     String description,
  //     String total_pages,
  //     String type_id) async {
  //   var request = await http.MultipartRequest(
  //       'POST', Uri.parse('http://localhost:8000/api/books'));
  //   request.fields.addAll({
  //     'title': title,
  //     'author_name': author_name,
  //     'points': points,
  //     'description': description,
  //     'total_pages': total_pages,
  //     'type_id': type_id
  //   });
  //   request.files.add(await http.MultipartFile.fromPath('file', pdf.path));
  //   request.files.add(await http.MultipartFile.fromPath('cover', image.path));
  //   //  request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(" status response is 200");
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print("status respnse is bad");
  //     print(response.reasonPhrase);
  //   }
  // }
  late dynamic pdf;
  solveProblem() async {
    final file = await MultipartFile.fromFile(image.files.first.path!,
        filename: "${image.files.first.name}.png");

    final file2 = await MultipartFile.fromFile(image!.files.first.path!,
        filename: "${image.files.first.name}.pdf");
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var data = FormData.fromMap({
      'cover': file,
      'file': file2,
      'title': Title_controller.text,
      'author_name': auther_name_Controller.text,
      'points': Points_Controller.text,
      'description': description_Controller.text,
      'total_pages': Totalpage_Controller.text,
      'type_id': Type_Controller.text
    });

    var dio = Dio();
    var response = await dio.request(
      'http://localhost:8000/api/books',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
     
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: medium_Brown,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Add book",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                       await getimage(ImageSource.gallery);
                     image = await FilePicker.platform.pickFiles();
                    },
                    child: image==null? Icon(Icons.add_a_photo):Container(
                    width: 150,
                    height: 150,
                     decoration:  BoxDecoration(
                       image: DecorationImage(
                         image: FileImage(image),fit: BoxFit.cover))
                       ),
                        ),
                  
                ],
              ),
            ),
          ),
          MyTextField(
            hintText1: 'Title',
            controller: Title_controller,
          ),
          MyTextField(
            hintText1: 'Auther name',
            controller: auther_name_Controller,
          ),
          MyTextField(
            hintText1: 'Type',
            controller: Type_Controller,
          ),
          MyTextField(
            hintText1: 'Total page',
            controller: Totalpage_Controller,
          ),
          MyTextField(
            hintText1: 'Points',
            controller: Points_Controller,
          ),
          MyTextField(
            hintText1: 'description',
            controller: description_Controller,
          ),
          MyTextField(
            hintText1: 'Files',
            controller: Files_Controller,
            IconButton: IconButton(
              onPressed: () async {
                pdf = await FilePicker.platform.pickFiles();
              },
              icon: Icon(Icons.folder),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  // createbook(
                  //     pdf!,
                  //     image!,
                  //     Title_controller.text,
                  //     auther_name_Controller.text,
                  //     Points_Controller.text,
                  //     description_Controller.text,
                  //     Totalpage_Controller.text,
                  //     "");
                  await solveProblem();
                  
                
                },
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.add,color: dark_Brown,)
                ),
              ),
            ),
          )
        ],
      
        ) ;
  }
}
