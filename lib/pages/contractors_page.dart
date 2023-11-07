import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/helper/helper_functions.dart';

class ContractorsPage extends StatelessWidget {
  const ContractorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C O N T R A C T O R S"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
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

          return ListView.builder(
            itemCount: contractors.length,
            itemBuilder: (context, index) {
              // get individual contractor
              final contractor = contractors[index];

              return ListTile(
                title: Text(contractor['username']),
                subtitle: Text(contractor['email']),
              );
            },
          );
        },
      ),
    );
  }
}
