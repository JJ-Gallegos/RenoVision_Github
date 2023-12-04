// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/helper/build_input_text.dart';
import 'package:renovision_app/helper/build_input_text_strings.dart';

class ContractorRegisterPage extends StatefulWidget {
  //final void Function()? onTap;

  const ContractorRegisterPage({
    super.key,
    //required this.onTap,
  });

  @override
  State<ContractorRegisterPage> createState() => _ContractorRegisterPageState();
}

class _ContractorRegisterPageState extends State<ContractorRegisterPage> {
  // text controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessEmailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController paintRateController = TextEditingController();
  final TextEditingController floorRateController = TextEditingController();
  final TextEditingController roofRateController = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "C O N T R A C T O R",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const Text(
                  "R E G I S T R A T I O N",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "C O N T A C T   I N F O R M A T I O N : ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // name textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputTextStrings(
                        label: 'First',
                        controller: firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputTextStrings(
                        label: 'Last',
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                // business name textfield
                BuildInputTextStrings(
                  label: 'Business Name',
                  controller: businessNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business name';
                    }
                    return null;
                  },
                ),

                // business email textfield
                BuildInputTextStrings(
                  label: 'Business Email',
                  controller: businessEmailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business email';
                    }
                    return null;
                  },
                ),

                // phone number textfield
                BuildInputTextStrings(
                  label: 'Phone Number',
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),

                // zipcode textfield
                BuildInputText(
                  label: 'Zipcode',
                  controller: zipcodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zipcode';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // hourly rate
                const Row(
                  children: [
                    Text(
                      'H O U R L Y   R A T E (s) :',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // painting rate textfield
                BuildInputText(
                  label: 'Painting: \$',
                  controller: paintRateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),

                // flooring rate textfield
                BuildInputText(
                  label: 'Flooring: \$',
                  controller: floorRateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),

                // roofing rate textfield
                BuildInputText(
                  label: 'Roofing: \$',
                  controller: roofRateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 40, right: 40, bottom: 25),
                  child: MyButton(
                    text: 'Register',
                    onTap: () async {
                      // Collect user information
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String businessName = businessNameController.text;
                      String businessEmail = businessEmailController.text;
                      String phoneNumber = phoneNumberController.text;
                      String zipcode = zipcodeController.text;
                      double paintRate = double.parse(paintRateController.text);
                      double floorRate = double.parse(floorRateController.text);
                      double roofRate = double.parse(roofRateController.text);

                      // Store user information in Firestore
                      await FirebaseFirestore.instance.collection("Contractors").add({
                        'firstName': firstName,
                        'lastName': lastName,
                        'businessName': businessName,
                        'businessEmail': businessEmail,
                        'phoneNumber': phoneNumber,
                        'zipcode': zipcode,
                        'paintRate': paintRate,
                        'floorRate': floorRate,
                        'roofRate': roofRate,
                      });

                      // Navigate to the next page
                      if (context.mounted) Navigator.pushNamed(context, '/paint_page');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
