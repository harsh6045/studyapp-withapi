import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/index_provider.dart';
import 'package:study/study.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Study2 App',
        home: Studyui(),
      ),
    );
  }
}
