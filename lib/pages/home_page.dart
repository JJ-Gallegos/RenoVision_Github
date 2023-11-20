import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  final void Function()? onTap;

  const HomePage({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
              text: 'Paint Estimation', 
              onTap:() {
                Navigator.pushNamed(context, '/paint_page');
                },
              ),

              const SizedBox(height: 25),

              MyButton(
              text: 'Flooring', 
              onTap:() {
                Navigator.pushNamed(context, '/flooring_page');
                },
              ),

              const SizedBox(height: 25),

              MyButton(
              text: 'Roofing', 
              onTap:() {
                Navigator.pushNamed(context, '/roofing_page');
                },
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
