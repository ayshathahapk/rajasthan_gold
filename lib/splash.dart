import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rajasthan_gold/Core/app_export.dart';

import '../Core/Utils/image_constant.dart';
import '../Core/Utils/size_utils.dart';
import '../New/LivePage/Screens/live_page_initialising.dart';
import '../New/NavigationBar/navigation_bar.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(liveRateInitializationProvider);
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          // MaterialPageRoute(builder: (context) => RsaHome()),
          MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
        );
      });
    });
    // getLocation1();
    // requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Center(
        child: Container(
          height: SizeUtils.height * 0.3,
          width: SizeUtils.height * 0.3,
          child: Image.asset(
            ImageConstants.logo,
          ),
        ),
      ),
    );
  }
}
