import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/shared/commponents/commponents.dart';
import 'package:flutterlogintaskbyriverpod/shared/style/themes.dart';
import 'package:flutterlogintaskbyriverpod/ui/login_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp(LoginScreen())));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings)
      {
        switch (settings.name)
        {
          case '/home':
            return PageTransition(
                child: startWidget,
                type: PageTransitionType.bottomToTop,
                settings: settings);
            break;

          default:
            return null;
        }
      },
      title: 'Flutter Login Riverpod',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}


class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Wait Widget binding complete..
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      //start new screen
      popAndNavigateByName(context : context,name: '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child:const Center(child: Image(image: AssetImage('assets/images/logonew.jpg'),fit: BoxFit.contain,)),
    );
  }
}


