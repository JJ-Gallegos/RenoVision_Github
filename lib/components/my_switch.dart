// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:renovision_app/theme/purple_mode.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeData.light() ? purpleMode : ThemeData.light();
    notifyListeners();
  }
}

final themeNotifier = ThemeNotifier();

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends
  State<MySwitch> with
  SingleTickerProviderStateMixin{

  bool isChecked = false;
  final Duration _duration = const Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration
    );

    _animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight
    ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn
        ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child){
            return Container(
              width: 55,
              height: 25,
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              decoration: BoxDecoration(
                color: isChecked ? Colors.deepPurple : Colors.grey.shade600,
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isChecked ? Colors.purple.shade400 : Colors.white,
                    blurRadius: 20,
                    offset: const Offset(0, 0)
                  )
                ]
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: _animation.value,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if(_animationController.isCompleted){
                            _animationController.reverse();
                          }else{
                            _animationController.forward();
                          }

                          isChecked = !isChecked;

                          // Toggle theme when the switch is turned on
                          if (isChecked) {
                          themeNotifier.toggleTheme();
                          }
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
          isChecked ? 'Purple' : '',
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w600,
          ),
              ),
        ),
      ],
    );
  }
}