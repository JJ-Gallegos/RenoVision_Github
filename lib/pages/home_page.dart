import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
    );
  }
}
