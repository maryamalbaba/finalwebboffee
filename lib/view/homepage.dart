import 'package:bofweb/core/Model/basic_model.dart';
import 'package:bofweb/core/Model/book_model%20copy.dart';
import 'package:bofweb/core/Model/report.dart';
import 'package:bofweb/core/Model/suggestion_model.dart';
import 'package:bofweb/core/constants/color.dart';
import 'package:bofweb/core/constants/linksapi.dart';
import 'package:bofweb/core/service/mostreading.dart';
import 'package:bofweb/core/service/showreport.dart';
import 'package:bofweb/core/service/suggestion.dart';
import 'package:bofweb/view/mostRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          //!this is the First row for most reading &&Sugestion
          children: [
            Column(
              //!this column for the word mostraeding &&it is container
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  child: Text(
                    'Most Reading',
                    style: TextStyle(
                      color: dark_Brown,
                      fontSize: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 400,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: medium_Brown,
                              offset: const Offset(0, 1),
                              blurRadius: 10,
                            )
                          ],
                          color: offwhite,
                        ),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: FutureBuilder(
                            future: mostreading(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                ListofEverything<Bookmodel> resList = snapshot
                                    .data as ListofEverything<Bookmodel>;
                                return PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: resList.listresult.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      linkservername +
                                                          resList
                                                              .listresult[index]
                                                              .cover))),
                                        ),
                                        SizedBox(
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(
                                                  "Book name:",
                                                  style: TextStyle(
                                                      color: dark_Brown,
                                                      fontSize: 17),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(
                                                  resList
                                                      .listresult[index].title,
                                                  style: TextStyle(
                                                      color: dark_Brown,
                                                      fontSize: 15),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(
                                                  "Auther:",
                                                  style: TextStyle(
                                                      color: dark_Brown,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(
                                                  resList.listresult[index]
                                                      .author_name,
                                                  style: TextStyle(
                                                      color: dark_Brown,
                                                      fontSize: 15),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    "Suggestions",
                    style: TextStyle(color: dark_Brown, fontSize: 20),
                  ),
                ),
                //SizedBox(height: 18,),
                FutureBuilder(
                  future: showsuggestion(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      ListofEverything<suggestionModel> temp =
                          snapshot.data as ListofEverything<suggestionModel>;
                      return Container(
                        //  padding: EdgeInsets.all(10),
                        height: 250,
                        width: 650,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: temp.listresult.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: medium_Brown,
                                          offset: const Offset(0, 1),
                                          blurRadius: 3,
                                        )
                                      ],
                                      color: offwhite,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 159, 193, 220),
                                                child: Text(
                                                    temp.listresult[index]
                                                        .user_name[0],
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: white)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  temp.listresult[index]
                                                      .user_name,
                                                  style: TextStyle(
                                                      color: dark_Brown)),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "the suggesstion:  " +
                                                temp.listresult[index].body,
                                            style: TextStyle(color: dark_Brown),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              "book author:  " +
                                                  temp.listresult[index]
                                                      .author_name,
                                              style:
                                                  TextStyle(color: dark_Brown)),
                                        ),
                                      ],
                                    )
                                    // Text(temp.listresult[index].body),

                                    ),
                              );
                            }),
                      );
                    } else {
                      //print( "snapshooooot"+snapshot.data.toString());
                      return CircularProgressIndicator();
                    }
                  },
                ),

                // Container(child: ListView.builder(
                //   itemCount: 3,
                //   itemBuilder: (context,index){return ListTile(
                //     title: Text("ghjh"),
                //   );},))
              ],
            )
          ]),

      ////////!2Row

      Row(
        children: [
          SizedBox(
            height: 430,
            width: 470,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Most Rating',
                      style: TextStyle(fontSize: 20, color: dark_Brown),
                    ),
                  ),
                ),
                const MostRating(),
              ],
            ),
          ),
          //SizedBox(width: 200,),
          Container(
            height: 400,
            width: 700,
            decoration: BoxDecoration(
              color: offwhite,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Report()
          )
        ],
      ),
    ]);

    //!
  }
}







class Report extends StatelessWidget {
   Report({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Report",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 5,),
                FutureBuilder(
                    future: showreport(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        ListofEverything<report> temp =
                            snapshot.data as ListofEverything<report>;
                        return SizedBox(
                            height: 350,
                            width: 600,
                            child: ListView.builder(
                                itemCount: temp.listresult.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 300,
                                    height: 175,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("the report: " +
                                              temp.listresult[index].body),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Book name:  " +
                                              temp.listresult[index].book.title
                                                  .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("User name:  " +
                                              temp.listresult[index].user
                                                  .user_name),
                                        ),
                                        Divider(
                                            indent: 10,
                                            endIndent: 10,
                                            color: Colors.grey)
                                      ],
                                    ),
                                  );
                                }));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            );
  }
}