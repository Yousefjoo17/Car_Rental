import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/features/splash/presentation/views/selection_View.dart';
import 'package:carrental/features/splash/presentation/views/widgets/Sliding_Text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; //0:1
  late Animation<Offset> slidingAnimation; //0: .......
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    // whenever you use controller use dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration([kprimaryColor0,kprimaryColor1,kprimaryColor2]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SizedBox(
                height: 140,
                width: 140,
                child: Image.asset(
                  AssetsData.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 6),
            SlidingText(
                slidingAnimation: slidingAnimation, text: 'find your dream car'),
          ],
        ),
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
       Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectionView(),
              ),
            );
    });
  }
}
