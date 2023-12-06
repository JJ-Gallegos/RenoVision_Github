import 'package:flutter/material.dart';
import 'package:renovision_app/components/help_button_custom.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_camera_appbar.dart';
import 'package:renovision_app/components/my_drawer.dart';
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
  final TextEditingController wallLengthFeetController =
      TextEditingController();
  final TextEditingController wallLengthInchController =
      TextEditingController();
  final TextEditingController wallWidthFeetController = TextEditingController();
  final TextEditingController wallWidthInchController = TextEditingController();
  final TextEditingController numOfWallsController = TextEditingController();
  final TextEditingController doorCountController = TextEditingController();
  final TextEditingController windowHeightController = TextEditingController();
  final TextEditingController windowWidthController = TextEditingController();
  final TextEditingController numOfWindowsController = TextEditingController();
  final TextEditingController baseboardHeightController =
      TextEditingController();
  final TextEditingController crownMoldingHeightController =
      TextEditingController();
  final TextEditingController resultController = TextEditingController();

  // disposes of values when calculated
  @override
  void dispose() {
    wallLengthFeetController.dispose();
    wallLengthInchController.dispose();
    wallWidthFeetController.dispose();
    wallWidthInchController.dispose();
    numOfWallsController.dispose();
    doorCountController.dispose();
    windowHeightController.dispose();
    windowWidthController.dispose();
    numOfWindowsController.dispose();
    baseboardHeightController.dispose();
    crownMoldingHeightController.dispose();
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
                            controller: wallLengthFeetController,
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
                            controller: wallLengthInchController,
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
                            controller: wallWidthFeetController,
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
                            controller: wallWidthInchController,
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
                    BuildInputText(
                      label: 'Number of walls',
                      controller: numOfWallsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of walls';
                        }
                        return null;
                      },
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
                    Text(
                      '*Standard American door size is 36 by 80 inches.\n'
                      '*Enter only the amount of doors in a given room.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    BuildInputText(
                      label: 'Number of doors',
                      controller: doorCountController,
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

                // Window Size ExpansionTile
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
                        const SizedBox(width: 10),
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
                  title: Row(
                    children: [
                      Text(
                        'T R I M  S I Z E :',
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
                          'Baseboard: molding that runs along the bottom of walls',
                          'Crown Molding: molding that runs along the top ceilings'
                          // Add more steps as needed
                        ],
                      ),
                    ],
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
                        // store wall values
                        double wallLength = (double.tryParse(
                                    wallLengthFeetController.text) ??
                                0) +
                            (double.tryParse(wallLengthInchController.text) ??
                                0 / 12);
                        double wallWidth = (double.tryParse(
                                    wallWidthFeetController.text) ??
                                0) +
                            (double.tryParse(wallWidthInchController.text) ??
                                0 / 12);
                        int numOfWalls =
                            int.tryParse(numOfWallsController.text) ?? 1;

                        // store door values
                        // standard door size is 36 x 80 inches
                        double doorSize = (36 * 80) / 144; // converts to feet
                        int numOfDoors =
                            int.tryParse(doorCountController.text) ?? 1;

                        // store window values
                        double windowHeight =
                            double.tryParse(windowHeightController.text) ?? 0;
                        double windowWidth =
                            double.tryParse(windowWidthController.text) ?? 0;
                        double windowSize = (windowHeight * windowWidth) / 144;
                        int numOfWindows =
                            int.tryParse(numOfWindowsController.text) ?? 1;

                        // store trim values
                        double baseboard =
                            (double.tryParse(baseboardHeightController.text) ??
                                    0) /
                                12;
                        double crownMolding = (double.tryParse(
                                    crownMoldingHeightController.text) ??
                                0) /
                            12;

                        wallLength -= (baseboard + crownMolding);
                        //print('Wall Length: $wallLength square feet');

                        // calculate wall area
                        double wallArea = numOfWalls * (wallLength * wallWidth);

                        // Print the wall area for debugging
                        //print('Wall Area: $wallArea square feet');

                        // subtract baseboard and crown molding
                        wallArea -= (doorSize * numOfDoors) +
                            (windowSize * numOfWindows);
                        // Print the adjust wall area for debugging
                        //print('Adjusted Wall Area: $wallArea square feet');

                        // calculate gallons needed (1 gallon per 400 sqft)
                        double gallonsNeeded = wallArea / 400;

                        resultController.text =
                            gallonsNeeded.toStringAsFixed(2);

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
