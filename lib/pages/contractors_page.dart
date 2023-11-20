import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/helper/helper_functions.dart';

class ContractorsPage extends StatelessWidget {
  const ContractorsPage({super.key});

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // any errors
          if (snapshot.hasError) {
            displayMessageToUser("Something went weong", context);
          }

          // show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return const Text("No Data");
          }

          // get all contractors
          final contractors = snapshot.data!.docs;

          return Column(
            children: [
              // // back button
              // const Padding(
              //   padding: EdgeInsets.only(
              //     top: 50,
              //     left: 25.0,
              //   ),
              //   child: Row(
              //     children: [
              //       MyBackButton(),
              //     ],
              //   ),
              // ),

              // list of contractors in the app
              Expanded(
                child: ListView.builder(
                  itemCount: contractors.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    // get individual contractor
                    final contractor = contractors[index];

                    return ListTile(
                      title: Text(contractor['username']),
                      subtitle: Text(contractor['email']),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
