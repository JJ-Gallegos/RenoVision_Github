// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_drawer.dart';
// import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_textfield.dart';
// import 'package:renovision_app/helper/helper_functions.dart';

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
  final TextEditingController nameController = TextEditingController();
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // // logo
                // Image.asset(
                //   'lib/images/renovision_logo.png',
                //   height: 140,
                // ),

                // const SizedBox(height: 20),

                // app name
                const Text(
                  "C O N T R A C T O R",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "R E G I S T R A T I O N",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 40),

                // hourly rate
                const Row(
                  children: [
                    Text(
                      "C O N T A C T : ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // name textfield
                MyTextField(
                  hintText: "Name",
                  obscureText: false,
                  controller: nameController,
                ),

                const SizedBox(height: 10),

                // business email textfield
                MyTextField(
                  hintText: "Business Email",
                  obscureText: false,
                  controller: businessEmailController,
                ),

                const SizedBox(height: 10),

                // phone number textfield
                MyTextField(
                  hintText: "Phone Number",
                  obscureText: false,
                  controller: phoneNumberController,
                ),

                const SizedBox(height: 10),

                // zipcode textfield
                MyTextField(
                  hintText: "Zipcode",
                  obscureText: false,
                  controller: zipcodeController,
                ),

                const SizedBox(height: 20),

                // hourly rate
                const Row(
                  children: [
                    Text(
                      "H O U R L Y  R A T E ( S ) : ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // painting rate textfield
                MyTextField(
                  hintText: "Painting: ",
                  obscureText: false,
                  controller: paintRateController,
                ),

                const SizedBox(height: 10),

                // flooring rate textfield
                MyTextField(
                  hintText: "Flooring: ",
                  obscureText: false,
                  controller: floorRateController,
                ),

                const SizedBox(height: 10),

                // roofing rate textfield
                MyTextField(
                  hintText: "Roofing: ",
                  obscureText: false,
                  controller: roofRateController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
