import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/helper/build_input_text.dart';
import 'package:renovision_app/helper/estimate_dialog_box.dart';

class FlooringPage extends StatefulWidget {
  final void Function(double result)? onTap;

  const FlooringPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FlooringPage> createState() => _FlooringPageState();
}

class _FlooringPageState extends State<FlooringPage> {
  // measurement controllers
  final TextEditingController matWidthController = TextEditingController();
  final TextEditingController matLengthController = TextEditingController();
  final TextEditingController gapSizeController = TextEditingController();
  final TextEditingController floorWidthFeetController =
      TextEditingController();
  final TextEditingController floorWidthInchController =
      TextEditingController();
  final TextEditingController floorLengthFeetController =
      TextEditingController();
  final TextEditingController floorLengthInchController =
      TextEditingController();
  final TextEditingController resultController = TextEditingController();

  // disposes of values when calculated
  @override
  void dispose() {
    super.dispose();
    matWidthController.dispose();
    matLengthController.dispose();
    gapSizeController.dispose();
    floorWidthFeetController.dispose();
    floorWidthInchController.dispose();
    floorLengthFeetController.dispose();
    floorLengthInchController.dispose();
    resultController.dispose();
  }

  // stores paint calculation
  double? floorCalculation;
  // stores gap size measurements
  String? selectedGapSize;
  double selectedGapSizeInches = 0.0;

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
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'F L O O R',
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
                  'P L A N K / T I L E',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  'S I Z E :',
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
                        label: 'Width (inches)*',
                        controller: matWidthController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Length (inches)*',
                        controller: matLengthController,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 200),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: 'Gap Size\n(optional)',
                          labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        value: selectedGapSize, // Set the initial value or null
                        items: const [
                          DropdownMenuItem(
                              value: '1/16', child: Text('1/16 inch')),
                          DropdownMenuItem(
                              value: '1/8', child: Text('1/8 inch')),
                          DropdownMenuItem(
                              value: '3/16', child: Text('3/16 inch')),
                          DropdownMenuItem(
                              value: '1/4', child: Text('1/4 inch')),
                          // Add more items as needed
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGapSize = value;
                            // Convert fractional inches to decimal inches and store as a numerical value
                            if (value != null) {
                              List<String> fractionParts = value.split('/');
                              if (fractionParts.length == 2) {
                                double numerator =
                                    double.parse(fractionParts[0]);
                                double denominator =
                                    double.parse(fractionParts[1]);
                                selectedGapSizeInches = numerator / denominator;
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
                        label: 'Width (feet)*',
                        controller: floorWidthFeetController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Width (inches)*',
                        controller: floorWidthInchController,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BuildInputText(
                        label: 'Length (feet)*',
                        controller: floorLengthFeetController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BuildInputText(
                        label: 'Length (inches)*',
                        controller: floorLengthInchController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                        text: 'Estimate!',
                        // get values from user input
                        onTap: () {
                          double matWidth =
                              (double.tryParse(matWidthController.text) ?? 0) / 12;

                          double matLength =
                              (double.tryParse(matLengthController.text) ?? 0) / 12;

                          double gapSize = selectedGapSizeInches;

                          double floorWidthFeet =
                              double.tryParse(floorWidthFeetController.text) ?? 0;

                          double floorWidthInch =
                              (double.tryParse(floorWidthInchController.text) ?? 0) / 12;

                          double floorLengthFeet =
                              double.tryParse(floorLengthFeetController.text) ?? 0;

                          double floorLengthInch =
                              (double.tryParse(floorLengthInchController.text) ?? 0) / 12;

                          // size of material
                          double matSize = matWidth * matLength;

                          // floor width
                          double floorWidth = floorWidthFeet + floorWidthInch;

                          // floor length
                          double floorLength = floorLengthFeet + floorLengthInch;

                          // calculate total area to cover
                          double floorArea = floorWidth * floorLength;

                          // calculate tile size
                          double tileSize = (matSize + gapSize) / 144;

                          // calculate amount of plank/tile needed
                          double totalMatNeeded = floorArea / tileSize;

                          // update the result text
                          resultController.text =
                              totalMatNeeded.toStringAsFixed(2);

                          // Show the result alert
                          CustomAlertDialog.showAlert(
                            context,
                            'Planks/Tiles Needed:\n\n${resultController.text} pieces',
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
