import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

              // users tile
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
              // users tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('H O W - T O'),
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // navigate to users page
                    Navigator.pushNamed(context, '/how_to_page');
                  },
                ),
              ),
            ],
          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25.0),
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
