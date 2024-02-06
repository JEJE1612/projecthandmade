import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handmade/cors/theme/assets.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Auth/presentaion/views/login_page.dart';
import 'package:handmade/feather/pages/onbording_page/widgets/on_bording_items.dart';
import 'package:handmade/feather/pages/onbording_page/widgets/onbording_image.dart';

class Onborording extends StatefulWidget {
  static const String nameKey = "Onborording";

  const Onborording({super.key});

  @override
  State<Onborording> createState() => _OnborordingState();
}

class _OnborordingState extends State<Onborording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        pageBodies: const [
          OnBordingitems(
            title1: "On your way...",
            title2: "'to find the perfect looking Onboarding for your app?',",
          ),
          OnBordingitems(
            title1: "On your way...",
            title2: "'to find the perfect looking Onboarding for your app?',",
          ),
          OnBordingitems(
            title1: "On your way...",
            title2: "'to find the perfect looking Onboarding for your app?',",
          ),
        ],
        background: [
          onbordingImage(context, SvgPicture.asset(AssetsData.onboardImage)),
          onbordingImage(context, SvgPicture.asset(AssetsData.onboardImage2)),
          onbordingImage(context, SvgPicture.asset(AssetsData.onboardImage3)),
        ],
        speed: 1.8,
        pageBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        onFinish: () {},
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: primary,
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        controllerColor: primary,
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        trailing: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            color: primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () {
          Navigator.pushNamed(context, LoginPage.nameKey);
        },
      ),
    );
  }
}
