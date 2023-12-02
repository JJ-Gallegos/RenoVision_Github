import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCamera extends StatelessWidget {
  final void Function()? onTap;

  const MyCamera({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await openMeasureApp();
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Icon(
              Icons.camera_alt_rounded,
              size: 60,
              color: Colors.grey.shade800
              ),
            const Text('S C A N'),
          ],
        ),
      ),
    );
  }
}

Future<void> openMeasureApp() async {
  final Uri appStoreLink = Uri.parse('https://apps.apple.com/us/app/measure/id1383426740');

  if (await canLaunchUrl(appStoreLink)) {
    await launchUrl(appStoreLink);
  } else {
    throw 'Could not launch $appStoreLink';
  }
}