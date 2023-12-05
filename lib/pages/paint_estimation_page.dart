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
                        // wall size values
                        double wallLengthFeet =
                            double.tryParse(wallLengthFeetController.text) ?? 0;
                        double wallLengthInch =
                            double.tryParse(wallLengthInchController.text) ?? 0;
                        double wallWidthFeet =
                            double.tryParse(wallWidthFeetController.text) ?? 0;
                        double wallWidthInch =
                            double.tryParse(wallWidthInchController.text) ?? 0;

                        // wall length/width in inches
                        double wallLength =
                            (wallLengthFeet * 12) + wallLengthInch;
                        double wallWidth = (wallWidthFeet * 12) + wallWidthInch;
                        int numOfWalls =
                            int.tryParse(numOfWallsController.text) ?? 1;
                        // total wall size
                        double totalWallSize =
                            numOfWalls * (wallLength * wallWidth);

                        // door size values
                        int numOfDoors =
                            int.tryParse(doorCountController.text) ?? 1;
                        // door size in square feet
                        double doorSize = (3 * 12) +
                            (6.67 *
                                12); // assuming doors are 3 ft wide and 6 ft 8 in tall
                        // total door size
                        double totalDoorSize = doorSize * numOfDoors;

                        // window size values
                        double windowHeight =
                            double.tryParse(windowHeightController.text) ?? 0;
                        double windowWidth =
                            double.tryParse(windowWidthController.text) ?? 0;
                        int numOfWindows =
                            int.tryParse(numOfWindowsController.text) ?? 1;
                        // window size in inches
                        double totalWindowSize =
                            numOfWindows * (windowHeight * windowWidth);

                        // trim size values
                        double baseboardHeight =
                            double.tryParse(baseboardHeightController.text) ??
                                0;
                        double crownMoldingHeight = double.tryParse(
                                crownMoldingHeightController.text) ??
                            0;

                        // subtract doors, windows, and trim from square footage
                        double adjustedTotalSquareFeet =
                            totalWallSize - totalDoorSize - totalWindowSize;

                        // calculate gallons needed (1 gallon per 400 square feet)
                        double gallonsNeeded =
                            adjustedTotalSquareFeet / (400.0 * 12);

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
