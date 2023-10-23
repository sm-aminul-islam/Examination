import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo_project/main.dart';

class DemoApi extends ConsumerWidget {
  const DemoApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catfact = ref.watch(catFactProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Future Provider"),
      ),
      body: Center(
        child: catfact.when(
          data: (data) {
            return Text(
              data,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            );
          },
          error: (e, _) {
            return Text("Something went to wrong");
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
