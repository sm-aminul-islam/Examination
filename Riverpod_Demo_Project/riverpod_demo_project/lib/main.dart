import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo_project/modules/home/controller/stateNotifier.dart';
import 'package:riverpod_demo_project/modules/home/view/api.dart';
import 'package:riverpod_demo_project/modules/home/view/homepage.dart';
import 'package:http/http.dart' as http;

final countProvider = StateNotifierProvider<CountNotifier, int>(
  (ref) => CountNotifier(0),
);

final catFactProvider = FutureProvider(
  (ref) async {
    final uri = Uri.parse('https://catfact.ninja/fact');
    final response = await http.get(uri);
    return json.decode(response.body)['fact'];
  },
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Riverpod Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: DemoApi());
  }
}
