import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/index_provider.dart';
import 'package:study/widgets/bottomappbar.dart';
import 'home_screen.dart';

class Studyui extends StatefulWidget {
  const Studyui({super.key});

  @override
  State<Studyui> createState() => _StudyuiState();
}

var totalpages = [HomeScreen(), Container(), Container(), Container(), Container()];

class _StudyuiState extends State<Studyui> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pageIndexProvider = Provider.of<IndexProvider>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/Menu.png",
                    height: 24,
                    width: 24,
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/message.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/images/Notification.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: bottomBar(context),
            body: totalpages[pageIndexProvider.indexno]));
  }
}
