import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/utils/utils.dart';
import 'package:qauuni/view/lost_find/add_lost_find.dart';
import 'package:qauuni/view_model/auth_view_model.dart';
import 'package:validators/validators.dart';
import 'dart:ui';

import '../../routes/route.dart';
import '../../utils/color.dart';
import '../../widgets/text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControlleruserName = TextEditingController();
  bool isloading = false;
  bool _passwordVisible = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    myControlleruserName.dispose();
    myControllerEmail.dispose();
    myControllerPassword.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool validData() {
    if (!isEmail(myControllerEmail.text)) {
      Utils.flushBarErrorMessage('Enter Valid Email Address', context);
      return false;
    }
    if ((myControlleruserName.text == "")) {
      Utils.flushBarErrorMessage('Please Enter User Name', context);

      return false;
    }
    if ((myControllerPhone.text == "")) {
      Utils.flushBarErrorMessage('Please Enter Valid Phone Number', context);

      return false;
    }
    if (myControllerPassword.text.isNotEmpty &&
        myControllerPassword.text.length < 6) {
      Utils.flushBarErrorMessage('Please Enter Valid Password', context);

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 123, 199, 254),
                    Color.fromARGB(255, 200, 13, 220),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: ImageIcon(
                        AssetImage('assets/logo.png'),
                        size: 200.0,
                        color: Colors.white,

                        //   color: Color(0xFF3A5A98),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _opacity.value,
                    child: Transform.scale(
                      scale: _transform.value,
                      child: Container(
                        width: size.width * .9,
                        height: size.height * 0.56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 90,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: black.withOpacity(.8),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: size.width * .9,
                                height: size.height * 0.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    component(
                                      icon: Icons.person_outline,
                                      hintText: 'User Name...',
                                      isPassword: false,
                                      isEmail: true,
                                      textediting: myControlleruserName,
                                    ),
                                    component(
                                      icon: Icons.email_outlined,
                                      hintText: 'Email...',
                                      isPassword: false,
                                      isEmail: true,
                                      textediting: myControllerEmail,
                                    ),
                                    component(
                                      icon: Icons.phone,
                                      hintText: 'Contact...',
                                      isPassword: false,
                                      isEmail: true,
                                      textediting: myControllerPhone,
                                    ),
                                    component(
                                        icon: Icons.lock_outline,
                                        hintText: 'Password...',
                                        isEmail: false,
                                        isPassword: true,
                                        textediting: myControllerPassword),

                                    //  SizedBox(height: size.width * .2),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          isloading = true;
                                        });

                                        if (validData() == true) {
                                          Map data = {
                                            'name': myControlleruserName,
                                            'email': myControllerEmail.text,
                                            'contact': myControllerPhone,
                                            'password':
                                                myControllerPassword.text,
                                          };
                                          authViewModel.signUpApis(
                                              data, context);
                                        } else {
                                          setState(() {
                                            isloading = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        //color: Colors.amber,
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: size.width * .05,
                                              ),
                                              height: size.width / 8,
                                              width: size.width / 1.25,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: buttoncolor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                'Sign-Up',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Get.toNamed(Routes.login);
                                                },
                                                child: text(
                                                    title: "Log-In",
                                                    color: Colors.black,
                                                    fontsize: 17.0,
                                                    fontweight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component({icon, hintText, isPassword, isEmail, textediting}) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: size.width / 8,
        width: size.width / 1.25,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 229, 229).withOpacity(.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: textediting,
          style: const TextStyle(
            color: Colors.black,
          ),
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            // suffixIcon: IconButton(
            //   icon: isPassword
            //       ? Icon(
            //           // Based on passwordVisible state choose the icon
            //           _passwordVisible ? Icons.visibility : Icons.visibility_off,
            //           color: Colors.black,
            //         )
            //       : Container(),
            //   onPressed: () {
            //     // Update the state i.e. toogle the state of passwordVisible variable
            //     setState(() {
            //       _passwordVisible = _passwordVisible;
            //     });
            //   },
            // ),

            prefixIcon: Icon(
              icon,
              color: Colors.black.withOpacity(.8),
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
