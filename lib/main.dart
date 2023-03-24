import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:muvi/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>(
  (ref) {
    return Dio(
      BaseOptions(baseUrl: 'https://showtimetestapi.azurewebsites.net/'),
    );
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      // home: const MovieDetailScreen(),
    );
  }
}
