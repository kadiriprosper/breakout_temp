import 'package:breakout_temp/constants/animation_constants.dart';
import 'package:breakout_temp/screens/main_page.dart';
import 'package:breakout_temp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
        () => Get.to(const MainPage()),
      ),
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: bgColorGradient,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Hero(
                  tag: titleAnimationTag,
                  child: Text(
                    'Retro Breakout',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: LinearProgressIndicator(
                    minHeight: 30,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
