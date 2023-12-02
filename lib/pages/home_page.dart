import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_camera.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/components/my_help_button.dart';

class HomePage extends StatelessWidget {
  final void Function()? onTap;

  const HomePage({
    super.key,
    this.onTap,
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 50, right: 50),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyHelpButton(
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'E S T I M A T I O N S',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Paint',
                  onTap: () {
                    Navigator.pushNamed(context, '/paint_page');
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Flooring',
                  onTap: () {
                    Navigator.pushNamed(context, '/flooring_page');
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Roofing',
                  onTap: () {
                    Navigator.pushNamed(context, '/roofing_page');
                  },
                ),
                const SizedBox(height: 65),
                const Text(
                  'C O N T R A C T O R S',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'View Contractors',
                  onTap: () {
                    Navigator.pushNamed(context, '/contractors_page');
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Register as Contractor',
                  onTap: () {
                    Navigator.pushNamed(context, '/contractor_register_page');
                  },
                ),
                const SizedBox(height: 40),
                MyCamera(
                  onTap: () {
                    Navigator.pushNamed(context, '/paint_page');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
