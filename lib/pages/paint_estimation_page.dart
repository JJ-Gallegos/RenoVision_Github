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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

              const SizedBox(height: 100),

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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: 'Calculate',
                    onTap: () {
                      // Get values from controllers
                      double widthFeet =
                          double.tryParse(widthFeetController.text) ?? 0.0;
                      double widthInches =
                          double.tryParse(widthInchController.text) ?? 0.0;
                      double heightFeet =
                          double.tryParse(heightFeetController.text) ?? 0.0;
                      double heightInches =
                          double.tryParse(heightInchController.text) ?? 0.0;

                      // Calculate width times height
                      double result = (widthFeet + widthInches / 12.0) *
                          (heightFeet + heightInches / 12.0);

                      // Update the state to store the result
                      setState(() {
                        paintCalculation = result;
                      });

                      // Call the callback function
                      if (widget.onTap != null) {
                        widget.onTap!(result);
                      }
                    },
                  ),
                ],
              ),

              // Display the result
              if (paintCalculation != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Result: ${paintCalculation.toString()}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
