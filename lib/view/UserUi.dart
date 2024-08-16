import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/user.dart';
import 'package:bofweb/core/Model/users.dart';
import 'package:bofweb/core/config/options.dart';
import 'package:bofweb/core/service/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersUi extends StatelessWidget {
  const UsersUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: show_users(getIt<SharedPreferences>().getInt('id')!),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            ListofEverything<UserModel> temp2 =
                snapshot.data as ListofEverything<UserModel>;

            return SizedBox(
                height: 350,
                width: 600,
                child: ListView.builder(
                    itemCount: temp2.listresult.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300,
                        height: 175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(" User name: " +
                                  temp2.listresult[index].user_name),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Book name:  " +
                                  temp2.listresult[index].title.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("User Level :  " +
                                  temp2.listresult[index].level),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Number of books that have read : " +
                                  temp2.listresult[index].books.toString()
                                  
                                  ),
                            ),
                            Divider(
                                indent: 10, endIndent: 10, color: Colors.grey)
                          ],
                        ),
                      );
                    }));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
