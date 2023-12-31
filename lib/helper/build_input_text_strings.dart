import 'package:flutter/material.dart';

class BuildInputTextStrings extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const BuildInputTextStrings(
      {super.key,
      required this.label,
      required this.controller,
      required String? Function(dynamic value) validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: controller,
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
