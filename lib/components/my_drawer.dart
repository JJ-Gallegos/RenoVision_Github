import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_switch.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Image.asset(
                  'lib/images/renovision_logo.png',
                  scale: 5,
                ),
              ),

              const SizedBox(height: 25),

              // home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('H O M E'),
                  onTap: () {
                    // this is already the home screen so just pop drawer
                    Navigator.pop(context);
                    // navigate to homw page
                    Navigator.pushNamed(context, '/home_page');
                  },
                ),
              ),

              // profile tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('P R O F I L E'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);
                    // navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),

              // contractors tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('C O N T R A C T O R S'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);
                    // navigate to users page
                    Navigator.pushNamed(context, '/contractors_page');
                  },
                ),
              ),

              const SizedBox(height: 15),

              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      '--- E S T I M A T I O N S ---',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.format_paint_outlined,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('P A I N T'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);
                    // navigate to users page
                    Navigator.pushNamed(context, '/paint_page');
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.align_vertical_bottom_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('F L O O R I N G'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);
                    // navigate to users page
                    Navigator.pushNamed(context, '/flooring_page');
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.roofing_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('R O O F I N G'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);
                    // navigate to users page
                    Navigator.pushNamed(context, '/roofing_page');
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 100),

          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: MySwitch(),
              ),
            ],
          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 50.0),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text('L O G O U T'),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // logout
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
