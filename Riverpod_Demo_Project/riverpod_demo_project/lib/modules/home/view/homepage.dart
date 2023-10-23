import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo_project/main.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Riverpod Demo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "$value",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 40),
                FloatingActionButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).decrement();
                  },
                  child: const Icon(Icons.remove_circle_rounded),
                ),
                const SizedBox(width: 40),
                FloatingActionButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).reset();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
