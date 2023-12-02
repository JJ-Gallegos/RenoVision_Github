import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/components/my_help_button.dart';
import 'package:renovision_app/helper/build_input_text.dart';

class PaintEstimationPage extends StatefulWidget {
  final void Function(double result)? onTap;

  const PaintEstimationPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PaintEstimationPage> createState() => _PaintEstimationPageState();
}

class _PaintEstimationPageState extends State<PaintEstimationPage> {
  // measurement text controllers
  final TextEditingController widthFeetController = TextEditingController();
  final TextEditingController widthInchController = TextEditingController();
  final TextEditingController heightFeetController = TextEditingController();
  final TextEditingController heightInchController = TextEditingController();
  final TextEditingController numberOfWallsController = TextEditingController();
  final TextEditingController baseboardHeightController = TextEditingController();
  final TextEditingController crownMoldingHeightController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  bool showGallonsNeeded = false;

  // disposes of values when calculated
  @override
  void dispose() {
    super.dispose();
    widthFeetController.dispose();
    widthInchController.dispose();
    heightFeetController.dispose();
    heightInchController.dispose();
    baseboardHeightController.dispose();
    crownMoldingHeightController.dispose();
    numberOfWallsController.dispose();
    resultController.dispose();
  }

  // stores paint calculation
  double? paintCalculation;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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

                Text(
                  'W A L L  S I Z E :',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Width (feet)',
                        controller: widthFeetController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Width (inches)',
                        controller: widthInchController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Height (feet)',
                        controller: heightFeetController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Height (inches)',
                        controller: heightInchController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Baseboard (inches)',
                        controller: baseboardHeightController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Crown Molding (inches)',
                        controller: crownMoldingHeightController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Column(
                  children: [
                    BuildInputText(
                      label: 'Number of walls',
                      controller: numberOfWallsController,
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'Estimate!',
                      onTap: () {
                        // Get values from controllers
                        double widthFeet =
                            double.tryParse(widthFeetController.text) ?? 0;
                        double widthInches =
                            (double.tryParse(widthInchController.text) ?? 0) / 12;
                        double totalWidth = widthFeet + widthInches;
                        double heightFeet =
                            double.tryParse(heightFeetController.text) ?? 0;
                        double heightInches =
                            (double.tryParse(heightInchController.text) ?? 0) / 12;
                        double totalHeight = heightFeet + heightInches;
                        double baseboardHeight =
                            (double.tryParse(baseboardHeightController.text) ?? 0) / 12;
                        double crownMoldingHeight = (double.tryParse(
                                    crownMoldingHeightController.text) ?? 0) / 12;
                        int numberofWalls =
                            int.tryParse(numberOfWallsController.text) ?? 1;

                        // calculate total square footage
                        double totalSquareFeet = totalWidth * totalHeight;

                        // subtract baseboard and crown molding from square footage
                        totalSquareFeet -= (baseboardHeight * totalWidth) +
                            (crownMoldingHeight * totalWidth);

                        // calculate gallons needed (1 gallon per 400 square feet)
                        // multiply by 2 for two coats typically needed
                        double gallonsNeeded = 2 * (totalSquareFeet / 400.0);

                        // multiple by number of walls
                        gallonsNeeded *= numberofWalls;

                        // update the result text
                        resultController.text =
                            gallonsNeeded.toStringAsFixed(2);

                        // Update the state to store the result
                        setState(() {
                          showGallonsNeeded = true;
                        });
                      },
                    ),
                  ],
                ),

                // Display the result
                Visibility(
                  visible: showGallonsNeeded,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Gallons Needed: ${resultController.text}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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
