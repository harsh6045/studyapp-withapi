import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/index_provider.dart';

bottomBar(context) {
  var pageIndexProvider = Provider.of<IndexProvider>(context);
  return Container(
    height: 70,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(0);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.indexno == 0
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: pageIndexProvider.indexno == 0
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  Text("Home")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(1);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.indexno == 1
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/openbook.png",
                  ),
                  Text("Learn")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(2);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.indexno == 2
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Hub.png",
                  ),
                  Text("Hub")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(3);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.indexno == 3
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Chat.png",
                  ),
                  Text("Chat")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(4);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.indexno == 4
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined),
                  Text("Profile")
                ],
              ))),
    ]),
  );
}
