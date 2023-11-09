import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';
// import 'package:renovision_app/components/paint_estimation_button.dart';

class HomePage extends StatefulWidget {
  // final void Function()? onTap;

  const HomePage({
    super.key,
    // required this.onTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

// // calculate paint
// calculatePaint() {

// }

class _HomePageState extends State<HomePage> {
  // calculate paint estimation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      // const PaintEstimation(
      //   text: 'Paint Estimation',
      //   onTap: calculatePaint,
      // ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
