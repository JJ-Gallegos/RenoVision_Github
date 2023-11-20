import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';

class FlooringPage extends StatefulWidget {
  const FlooringPage({super.key});

  @override
  State<FlooringPage> createState() => _FlooringPageState();
}

class _FlooringPageState extends State<FlooringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/renovision_logo.png',
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Flooring'),
      ),
    );
  }
}