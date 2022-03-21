import 'dart:io';
import 'package:currency_tracker/views/home_view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_bloc.dart';

void main() async {
  HttpOverrides.global = new PostHttpOverrides();
  runApp(const MyApp());
}

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SearchBloc(),
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomeView()));
  }
}
