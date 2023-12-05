import 'package:flutter/material.dart';

class MyHelpButtonCustom extends StatelessWidget {
  final void Function()? onTap;
  final List<String> helpSteps;

  const MyHelpButtonCustom({
    super.key,
    required this.onTap,
    required this.helpSteps,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showHelpDialog(context, helpSteps);
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.help,
              size: 23,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
      ),
    );
  }
}

void _showHelpDialog(BuildContext context, List<String> helpSteps) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('What are these?'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: helpSteps.map((step) => Text('* $step\n')).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'Close',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      );
    },
  );
}
