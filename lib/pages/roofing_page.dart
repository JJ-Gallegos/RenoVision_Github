import 'package:flutter/material.dart';
import 'package:renovision_app/components/help_button_custom.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_camera_appbar.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/helper/build_input_text.dart';
import 'package:renovision_app/helper/estimate_dialog_box.dart';

class RoofingPage extends StatefulWidget {
  final void Function(double result)? onTap;

  const RoofingPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RoofingPage> createState() => _RoofingPageState();
}

class _RoofingPageState extends State<RoofingPage> {
  // measurement controllers
  final TextEditingController shingleWidthController = TextEditingController();
  final TextEditingController shingleLengthController = TextEditingController();
  final TextEditingController roofWidthFeetController = TextEditingController();
  final TextEditingController roofWidthInchController = TextEditingController();
  final TextEditingController roofLengthFeetController =
      TextEditingController();
  final TextEditingController roofLengthInchController =
      TextEditingController();
  final TextEditingController resultController = TextEditingController();

  // disposes of values when calculated
  @override
  void dispose() {
    shingleWidthController.dispose();
    shingleLengthController.dispose();
    roofWidthFeetController.dispose();
    roofWidthInchController.dispose();
    roofLengthFeetController.dispose();
    roofLengthInchController.dispose();
    resultController.dispose();
    super.dispose();
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCameraAppBar(
              onTap: () {
                // Handle camera button tap if needed
              },
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'R O O F',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const Text(
                  'E S T I M A T I O N',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'S H I N G L E   S I Z E :',
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyHelpButtonCustom(
                      onTap: () {
                        // Your onTap logic
                      },
                      helpSteps: const [
                        'Overlap of shingles is accounted for in the estimation',
                        // Add more steps as needed
                      ],
                    ),
                  ],
                ),
                // Text(
                //   'S I Z E :',
                //   style: TextStyle(
                //     fontSize: 25,
                //     color: Theme.of(context).colorScheme.secondary,
                //   ),
                // ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Length (inches)*',
                        controller: shingleLengthController,
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
                      child: BuildInputText(
                        label: 'Width (inches)*',
                        controller: shingleWidthController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Text(
                  'A R E A   T O   C O V E R :',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Length (feet)*',
                        controller: roofLengthFeetController,
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
                      child: BuildInputText(
                        label: 'Length (inches)*',
                        controller: roofLengthInchController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Width (feet)*',
                        controller: roofWidthFeetController,
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
                      child: BuildInputText(
                        label: 'Width (inches)*',
                        controller: roofWidthInchController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 110),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                        text: 'Estimate!',
                        // get values from user input
                        onTap: () {
                          // shingle size values
                          double shingleWidth =
                              double.tryParse(shingleWidthController.text) ?? 0;
                          double shingleLength =
                              double.tryParse(shingleLengthController.text) ??
                                  0;

                          // roof size values
                          double roofWidthFeet =
                              double.tryParse(roofWidthFeetController.text) ??
                                  0;
                          double roofWidthInch =
                              double.tryParse(roofWidthInchController.text) ??
                                  0;
                          double roofLengthFeet =
                              double.tryParse(roofLengthFeetController.text) ??
                                  0;
                          double roofLengthInch =
                              double.tryParse(roofLengthInchController.text) ??
                                  0;

                          // size of shingle
                          double shingleSize = shingleWidth * shingleLength;

                          // floor length/width in inches
                          double roofLength =
                              (roofLengthFeet * 12) + roofLengthInch;
                          double roofWidth =
                              (roofWidthFeet * 12) + roofWidthInch;

                          // calculate total area to cover
                          double roofArea = roofWidth * roofLength;

                          // calculate amount of shingles needed
                          double totalShingleNeeded = roofArea / shingleSize;

                          // round total plank/tile needed up to whole value
                          int roundedShingleNeeded = totalShingleNeeded.ceil();

                          // update the result text
                          resultController.text =
                              roundedShingleNeeded.toStringAsFixed(0);

                          // Show the result alert
                          CustomAlertDialog.showAlert(
                            context,
                            'Shingles Needed:\n\n${resultController.text} pieces',
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
