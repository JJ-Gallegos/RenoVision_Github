import 'package:flutter/material.dart';
import 'package:renovision_app/components/my_button.dart';
import 'package:renovision_app/components/my_drawer.dart';
import 'package:renovision_app/components/my_textfield.dart';

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
  final TextEditingController baseboardHeightController =
      TextEditingController();
  final TextEditingController crownMoldingHeightController =
      TextEditingController();
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
      //backgroundColor: Theme.of(context).colorScheme.background,
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
      
                const SizedBox(height: 80),
      
                Text(
                  'W A L L  S I Z E :',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
      
                const SizedBox(height: 40),
      
                const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Width (feet)'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text('Width (inches)'),
                        ),
                      ],
                    ),
                  ],
                ),
      
                const SizedBox(height: 5),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyTextField(
                        hintText: 'Width (feet)',
                        obscureText: false,
                        controller: widthFeetController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: MyTextField(
                        hintText: 'Width (inches)',
                        obscureText: false,
                        controller: widthInchController,
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 15),
      
                const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Height (feet)'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text('Height (inches)'),
                        ),
                      ],
                    ),
                  ],
                ),
      
                const SizedBox(height: 5),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyTextField(
                        hintText: 'Height (feet)',
                        obscureText: false,
                        controller: heightFeetController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: MyTextField(
                        hintText: 'Height (inches)',
                        obscureText: false,
                        controller: heightInchController,
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 15),
      
                const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Height (inches)'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text('Height (inches)'),
                        ),
                      ],
                    ),
                  ],
                ),
      
                const SizedBox(height: 5),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyTextField(
                        hintText: 'Baseboard',
                        obscureText: false,
                        controller: baseboardHeightController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: MyTextField(
                        hintText: 'Crown Molding',
                        obscureText: false,
                        controller: crownMoldingHeightController,
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 15),
      
                const Column(
                  children: [
                    Row(
                      children: [
                        Text('Number of walls'),
                      ],
                    ),
                  ],
                ),
      
                const SizedBox(height: 5),
      
                Column(
                  children: [
                    MyTextField(
                      hintText: 'Number of walls',
                      obscureText: false,
                      controller: numberOfWallsController,
                    )
                  ],
                ),
      
                const SizedBox(height: 20),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'Estimate!',
                      onTap: () {
                        // Get values from controllers
                        double widthFeet = double.tryParse(widthFeetController.text) ?? 0;
                        double widthInches = (double.tryParse(widthInchController.text) ?? 0) / 12;
                        double totalWidth = widthFeet + widthInches;
                        double heightFeet = double.tryParse(heightFeetController.text) ?? 0;
                        double heightInches = (double.tryParse(heightInchController.text) ?? 0) / 12;
                        double totalHeight = heightFeet + heightInches;
                        double baseboardHeight = (double.tryParse(baseboardHeightController.text) ?? 0) / 12;
                        double crownMoldingHeight = (double.tryParse(crownMoldingHeightController.text) ?? 0) / 12;
                        int numberofWalls = int.tryParse(numberOfWallsController.text) ?? 1;

                        // calculate total square footage
                        double totalSquareFeet = totalWidth * totalHeight;

                        // subtract baseboard and crown molding from square footage
                        totalSquareFeet -= (baseboardHeight * totalWidth) + (crownMoldingHeight * totalWidth);

                        // calculate gallons needed (1 gallon per 400 square feet)
                        double gallonsNeeded = totalSquareFeet / 400.0;

                        // multiple by number of walls
                        gallonsNeeded *= numberofWalls;

                        // update the result text
                        resultController.text = gallonsNeeded.toStringAsFixed(2);
      
                        // Update the state to store the result
                        setState(() {
                          showGallonsNeeded = true;
                        });
      
                      //   // Call the callback function
                        // if (widget.onTap != null) {
                        //   widget.onTap!(resultController as double);
                        // }
                      },
                    ),
                  ],
                ),
      
                // Display the result
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Gallons Needed: ${resultController.text}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
