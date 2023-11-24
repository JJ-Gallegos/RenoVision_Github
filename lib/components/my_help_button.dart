import 'package:flutter/material.dart';

class MyHelpButton extends StatelessWidget {
  final void Function()? onTap;
  // final String text;

  const MyHelpButton({
    super.key, 
    required this.onTap, 
    // required this.text
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showHelpDialog(context);
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.help,
              size: 30,
              color: Colors.grey.shade800
            ),
            // Text(
            //   text,
            //   style: const TextStyle(
            //     fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('How To Use'),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('- Step 1: Open Measure App\n'),
              Text('- Step 2: Take your measurements\n'),
              Text('- Step 3: Click "Estimate!"\n'),
              Text('- Step 4: Choose desired renovation\n'),
              Text('- Step 5: Enter your measurements\n'),
              Text('- Step 6: Click "Calculate!"'),
              // Add more steps as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
