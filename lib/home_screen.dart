import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/all_controller/lessons_controler.dart';
import 'package:study/all_controller/programs_controller.dart';
import 'package:study/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var programjson;
  var eventjson;
  var lessonjson;
  var loading = true;

  Future readJsonprogram() async {
    var response = await rootBundle.loadString("assets/json/program_json.json");
    var data = json.decode(response);

    setState(() {
      programjson = data;
    });
    print(programjson);
  }

  Future readJsonevent() async {
    var response1 = await rootBundle.loadString("assets/json/event_json.json");
    var data1 = json.decode(response1);

    setState(() {
      eventjson = data1;
    });
    print(eventjson);
  }

  Future readJsonlesson() async {
    var response2 = await rootBundle.loadString("assets/json/lesson_json.json");
    var data2 = json.decode(response2);

    setState(() {
      lessonjson = data2;
    });
    print(lessonjson);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    readJsonprogram().whenComplete(() => readJsonevent()
        .whenComplete(() => readJsonlesson().whenComplete(() => setState(() {
              loading = false;
            }))));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(3, 10, 3, 10),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello, Priya!",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What do you want to learn today?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Use spaceEvenly for equal spacing
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue), // Set the border color to blue
                              borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                            ),
                            child: ListTile(
                              leading: Image(image: AssetImage("assets/images/icons/Book-mark.png")),
                              title: Text(
                                "Program",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue), // Set the border color to blue
                              borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                            ),
                            child: ListTile(
                              leading: Image(image: AssetImage("assets/images/icons/help-circle.png")),
                              title: Text(
                                "Get help",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Use spaceEvenly for equal spacing
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue), // Set the border color to blue
                              borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                            ),
                            child: ListTile(
                              leading: Image(image: AssetImage("assets/images/icons/Book-open.png")),
                              title: Text(
                                "Learn",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue), // Set the border color to blue
                              borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                            ),
                            child: ListTile(
                              leading: Image(image: AssetImage("assets/images/icons/DD Tracker.png")),
                              title: Text(
                                "DD Tracker",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Programs for you",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: FutureBuilder(
                            future: ProgramsController().getPrograms(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                var items = snapshot.data["items"] as List;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: items.length,
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 28,
                                        ),
                                        CardWidget(
                                            programjson["program"][index]["image"],
                                            items[index]["category"],
                                            items[index]["name"],
                                            "${items[index]["lesson"]} lessons",
                                            0),
                                      ],
                                    );
                                  }),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Events and Experience",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 28,
                                  ),
                                  CardWidget(
                                      eventjson["events"][index]["image"],
                                      eventjson["events"][index]["title"],
                                      eventjson["events"][index]["course"],
                                      eventjson["events"][index]["session"],
                                      1),
                                ],
                              );
                            })),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Lessons for you",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: FutureBuilder(
                            future: LessonsController().getLessons(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                var items = snapshot.data["items"] as List;

                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 28,
                                          ),
                                          CardWidget(
                                            lessonjson["lesson"][index]
                                                ["image"],
                                            items[index]["category"],
                                            items[index]["name"],
                                            "${items[index]["duration"]} hours",
                                            2,
                                            lock: items[index]['locked'],
                                          ),
                                        ],
                                      );
                                    }));
                              }
                            }),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
