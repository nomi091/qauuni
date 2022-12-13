import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qauuni/view/auth_screen/login_screen.dart';
import 'package:qauuni/view/home_screen/home.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  int splashtime = 5; 
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context){
              return const Home();       
        }));
    }); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body:Container(
               alignment: Alignment.center,
               child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //vertically align center
                  children:<Widget>[
                    Container(
                      child:SizedBox(
                        height:200,width:200,
                        child:Image.asset("assets/logo.png")
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:30),
                      //margin top 30
                      child:const Text("QAU Services", style: TextStyle(
                          fontSize: 30,
                      ),),
                    ),
                    Container(
                      margin:const EdgeInsets.only(top:15),
                      child:const Text("Version: 2.1.0", style:TextStyle(
                         color:Colors.black45,
                         fontSize: 20,
                      )),
                    ),
                  ]
               )
            )  
      );
  }
}