import 'package:flutter/material.dart';
import 'package:qauuni/view/auth_screen/login_screen.dart';
import 'package:qauuni/view/home_screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 5;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString('token');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return token == null ? const LoginScreen() : const Home();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children: <Widget>[
                  Container(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/logo2.png")),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    //margin top 30
                    child: const Text(
                      "QAU Services",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const CircularProgressIndicator(
                      color: Color.fromARGB(255, 137, 169, 245)),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text("Version: 2.1.0",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        )),
                  ),
                ])));
  }
}
