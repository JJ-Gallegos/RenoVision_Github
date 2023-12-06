import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/components/my_list_tile.dart';
import 'package:renovision_app/pages/contractor_register_page.dart';

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
      body: const ContractorList(),
    );
  }
}

class ContractorList extends StatelessWidget {
  const ContractorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ContractorRepository.contractors.length,
      itemBuilder: (context, index) {
        Contractor contractor = ContractorRepository.contractors[index];

        return GestureDetector(
          onTap: () {
            // Navigate to contractor profile page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContractorProfilePage(contractor),
              ),
            );
          },
          child: MyListTile(
            title: '${contractor.firstName} ${contractor.lastName}',
            subTitle:
                'Business: ${contractor.businessName}\nEmail: ${contractor.businessEmail}\nZipcode: ${contractor.zipcode}',
          ),
        );
      },
    );
  }
}

class ContractorProfilePage extends StatelessWidget {
  final Contractor contractor;

  const ContractorProfilePage(this.contractor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "C O N T R A C T O R",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "P R O F I L E",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text('Name: ${contractor.firstName} ${contractor.lastName}'),
            Text('Business Name: ${contractor.businessName}'),
            Text('Business Email: ${contractor.businessEmail}'),
            Text('Phone Number: ${contractor.phoneNumber}'),
            Text('Zip Code: ${contractor.zipcode}'),
            const Text('Hourly Rate(s):'),
            Text('Painting: \$${contractor.paintRate}'),
            Text('Flooring: \$${contractor.floorRate}'),
            Text('Roofing: \$${contractor.roofRate}'),
          ],
        ),
      ),
    );
  }
}
