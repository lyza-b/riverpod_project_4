import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

const names = [
  'Alice',
  'Bob',
  'Charles',
  'David',
  'Evalina',
  'Freddie',
  'Ginny',
  'Harry',
  'Joseph',
  'Kelly',
  'Larry'
      'Mariana'
];

final tickerProvider = StreamProvider(
  (ref) => Stream.periodic(
    const Duration(seconds: 2),
    (i) => i + 1,
  ),
);

final nameProvider = StreamProvider((ref) {
   final a = ref.watch(tickerProvider).map(data: data, error: error, loading: loading)
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Stream Provider'),
        centerTitle: true,
      ),
    );
  }
}
