import 'package:bookly_app/Features/Splash/Presentation/views/splash_view.dart';
import 'package:bookly_app/Features/Splash/Presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssestDate.logo),
        SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.KHomeView);
    });
  }
}
