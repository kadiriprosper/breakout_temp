import 'package:breakout_temp/constants/animation_constants.dart';
import 'package:breakout_temp/main.dart';
import 'package:breakout_temp/screens/level_page.dart';
import 'package:breakout_temp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: bgColorGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HighScore: 0000',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
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
              const Spacer(),
              MainPageButton(
                onTap: () {
                  Get.to(const LevelPage());
                },
                label: 'Play',
              ),
              const SizedBox(height: 10),
              MainPageButton(
                onTap: () {
                  Get.dialog(
                    SettingsDialog(),
                  );
                },
                label: 'Settings',
              ),
              const SizedBox(height: 10),
              MainPageButton(
                onTap: () {
                  Get.dialog(
                    CustomDialogWidget(),
                  );
                },
                label: 'Exit',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
        color: buttonColor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      iconSize: 30,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomSettingsSlider(
              label: 'Music',
            ),
            const SizedBox(height: 20),
            CustomSettingsSlider(
              label: 'Sfx',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomSettingsSlider extends StatelessWidget {
  const CustomSettingsSlider({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Slider.adaptive(
          value: 3,
          max: 5,
          min: 1,
          divisions: 5,
          onChanged: (value) {},
          thumbColor: borderSideColor,
          inactiveColor: Colors.brown,
          activeColor: Colors.red,
        )
      ],
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.5,
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
        color: buttonColor,
        child: Column(
          children: [
            const Spacer(),
            Text('Are you sure you want to exit?'),
            const Spacer(),
            ButtonBar(
              children: [
                MaterialButton(
                  height: 50,
                  onPressed: () {},
                  child: const Text('Yes'),
                ),
                MaterialButton(
                  color: Colors.black,
                  height: 50,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MainPageButton extends StatelessWidget {
  const MainPageButton({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.4,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: borderSideColor,
        ),
      ),
      height: 60,
      onPressed: onTap,
      color: buttonColor,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
