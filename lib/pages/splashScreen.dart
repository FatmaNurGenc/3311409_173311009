import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/pages/home_page.dart';
import 'package:moddas_mobil_app_deneme/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundImage: const AssetImage('assets/sp_screen.jpg'),
      logo: const Image(
        image: AssetImage('assets/DAS-LOGO-BEYAZ.png'),
      ),
      logoSize: 100,
      showLoader: true,
      loaderColor: Colors.blue,
      loadingText: const Text(
        "Yükleniyor...",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      navigator: LoginApp(),
      durationInSeconds: 5,
    );
  }
}

class FadeInFadeOutRoute<T> extends MaterialPageRoute<T> {
  FadeInFadeOutRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(opacity: animation, child: child);
  }
}
