import 'package:flutter/material.dart';
import 'package:flutter_app/shared/constants/app_images.dart';
import 'package:flutter_app/presentation/feature/widgets/image_network.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Image.asset(
        //   AppImages.png('logo'),
        //   scale: 1.5,
        // ),
        child: ImageNetwork(
          url: AppImages.png('logo'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
