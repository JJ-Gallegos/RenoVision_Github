import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';

class RoofingPage extends StatefulWidget {
  const RoofingPage({super.key});

  @override
  State<RoofingPage> createState() => _RoofingPageState();
}

class _RoofingPageState extends State<RoofingPage> {
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
        child: Text('Roofing'),
      ),
    );
  }
}