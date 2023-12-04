import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_camera_appbar.dart';
import 'package:renovision_app/components/my_drawer.dart';
//import 'package:renovision_app/components/my_help_button.dart';
import 'package:renovision_app/helper/build_input_text.dart';
import 'package:renovision_app/helper/estimate_dialog_box.dart';

class PaintEstimationPage extends StatefulWidget {
  final void Function(double result)? onTap;

  const PaintEstimationPage({
    super.key,
    required this.onTap,
  });

  @override
  State<PaintEstimationPage> createState() => _PaintEstimationPageState();
}

class _PaintEstimationPageState extends State<PaintEstimationPage> {
  // measurement text controllers
  final TextEditingController lengthFeetController = TextEditingController();
  final TextEditingController lengthInchController = TextEditingController();
  final TextEditingController widthFeetController = TextEditingController();
  final TextEditingController widthInchController = TextEditingController();
  final TextEditingController heightFeetController = TextEditingController();
  final TextEditingController heightInchController = TextEditingController();
  final TextEditingController baseboardHeightController =
      TextEditingController();
  final TextEditingController crownMoldingHeightController =
      TextEditingController();
  final TextEditingController doorHeightController = TextEditingController();
  final TextEditingController doorWidthController = TextEditingController();
  final TextEditingController numOfDoorsController = TextEditingController();
  final TextEditingController windowHeightController = TextEditingController();
  final TextEditingController windowWidthController = TextEditingController();
  final TextEditingController numOfWindowsController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  // disposes of values when calculated
  @override
  void dispose() {
    lengthFeetController.dispose();
    lengthInchController.dispose();
    widthFeetController.dispose();
    widthInchController.dispose();
    heightFeetController.dispose();
    heightInchController.dispose();
    baseboardHeightController.dispose();
    crownMoldingHeightController.dispose();
    doorHeightController.dispose();
    doorWidthController.dispose();
    numOfDoorsController.dispose();
    windowHeightController.dispose();
    windowWidthController.dispose();
    numOfWindowsController.dispose();
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
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'P A I N T',
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

                // Wall Size ExpansionTile
                ExpansionTile(
                  title: Text(
                    'W A L L  S I Z E :',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  children: [
                    // Length Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Length (feet)',
                            controller: lengthFeetController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the length in feet';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Length (inches)',
                            controller: lengthInchController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the length in inches';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    // Width Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Width (feet)',
                            controller: widthFeetController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the width in feet';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Width (inches)',
                            controller: widthInchController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the width in inches';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    // Height Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Height (feet)',
                            controller: heightFeetController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the height in feet';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Height (inches)',
                            controller: heightInchController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the height in inches';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                // Door Size ExpansionTile
                ExpansionTile(
                  title: Text(
                    'D O O R   S I Z E :',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Height (inches)',
                            controller: doorHeightController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your door height';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Width (inches)',
                            controller: doorWidthController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your door width';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    BuildInputText(
                      label: 'Number of doors',
                      controller: numOfDoorsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of doors';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                // Trim Size ExpansionTile
                ExpansionTile(
                  title: Text(
                    'W I N D O W  S I Z E :',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Height (inches)',
                            controller: windowHeightController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your window height';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Width (inches)',
                            controller: windowWidthController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your window width';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    BuildInputText(
                      label: 'Number of windows',
                      controller: numOfWindowsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of windows';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                // Trim Size ExpansionTile
                ExpansionTile(
                  title: Text(
                    'T R I M  S I Z E :',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BuildInputText(
                            label: 'Baseboard Height\n(inches)',
                            controller: baseboardHeightController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the baseboard height';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BuildInputText(
                            label: 'Crown Molding\n(inches)',
                            controller: crownMoldingHeightController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the crown molding height';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'Estimate!',
                      onTap: () {
                        // wall size values
                        double lengthFeet =
                            double.tryParse(lengthFeetController.text) ?? 0;
                        double lengthInch =
                            double.tryParse(lengthInchController.text) ?? 0;
                        double widthFeet =
                            double.tryParse(widthFeetController.text) ?? 0;
                        double widthInches =
                            double.tryParse(widthInchController.text) ?? 0;
                        double heightFeet =
                            double.tryParse(heightFeetController.text) ?? 0;
                        double heightInches =
                            double.tryParse(heightInchController.text) ?? 0;
                        // wall length/width/height in inches
                        double wallLength = (lengthFeet * 12) + lengthInch;
                        double wallWidth = (widthFeet * 12) + widthInches;
                        double wallHeight = (heightFeet * 12) + heightInches;

                        // door size values
                        double doorHeight =
                            double.tryParse(doorHeightController.text) ?? 0;
                        double doorWidth =
                            double.tryParse(doorWidthController.text) ?? 0;
                        int numOfDoors =
                            int.tryParse(numOfDoorsController.text) ?? 1;
                        // door size in inches
                        double doorSize = doorHeight * doorWidth;

                        // window size values
                        double windowHeight =
                            double.tryParse(windowHeightController.text) ?? 0;
                        double windowWidth =
                            double.tryParse(windowWidthController.text) ?? 0;
                        int numOfWindows =
                            int.tryParse(numOfWindowsController.text) ?? 1;
                        // window size in inches
                        double windowSize = windowHeight * windowWidth;

                        // trim size values
                        double baseboardHeight =
                            double.tryParse(baseboardHeightController.text) ??
                                0;
                        double crownMoldingHeight = double.tryParse(
                                crownMoldingHeightController.text) ??
                            0;

                        // calculate total square footage
                        double totalSquareFeet =
                            2 * (wallLength + wallWidth) * wallHeight;

                        // subtract doors,windwos,trim from square footage
                        double adjustedTotalSquareFeet =
                            totalSquareFeet - (doorSize + windowSize);

                        // calculate gallons needed (1 gallon per 400 square feet)
                        // multiply by 2 for two coats typically needed
                        double gallonsNeeded = adjustedTotalSquareFeet / 400.0;

                        // update the result text
                        resultController.text =
                            gallonsNeeded.toStringAsFixed(0);

                        // Show the result alert
                        CustomAlertDialog.showAlert(
                          context,
                          'Paint Needed:\n\n${resultController.text} gallons',
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
