import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/view_model/auth/auth_view_model.dart';
import 'package:validators/validators.dart';
import '../../routes/route.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../../widgets/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControlleruserName = TextEditingController();
  bool isloading = false;
  final bool _passwordVisible = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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
    myControllerEmail.dispose();
    myControllerPassword.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool validData() {
    if (!isEmail(myControllerEmail.text)) {
      Utils.flushBarErrorMessage('Please Enter Valid Email Address', context);

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
                        AssetImage('assets/logo2.png'),
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
                        height: size.height * 0.5,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: black.withOpacity(.8),
                              ),
                            ),
                            component(
                              icon: Icons.email_outlined,
                              hintText: 'Email...',
                              isPassword: false,
                              isEmail: true,
                              textediting: myControllerEmail,
                            ),
                            component(
                                icon: Icons.lock_outline,
                                hintText: 'Password...',
                                isEmail: false,
                                isPassword: true,
                                textediting: myControllerPassword),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //  color: Colors.amberAccent,
                                    alignment: Alignment.topLeft,
                                    // width: size.width * .8,
                                    child: RichText(
                                      text: TextSpan(
                                        // text: 'Forgotten password?',
                                        text: '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // HapticFeedback.lightImpact();
                                            // Utils.flushBarErrorMessage(
                                            //     "Incorrect Username or Password",
                                            //     context);
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                Routes.home,
                                                (route) => false);
                                          },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    //  color: Colors.amberAccent,
                                    alignment: Alignment.topLeft,
                                    // width: size.width * .8,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Login As Guest',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            HapticFeedback.lightImpact();
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                Routes.home,
                                                (route) => false);
                                            // Utils.flushBarErrorMessage(
                                            //     "Incorrect Username or Password",
                                            //     context);
                                          },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //  SizedBox(height: size.width * .2),

                            Container(
                              //color: Colors.amber,
                              child: Consumer<AuthViewModel>(
                                  builder: (context, value, child) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (validData() == true) {
                                          Map data = {
                                            'email': myControllerEmail.text,
                                            'password':
                                                myControllerPassword.text,
                                          };
                                          if (value.loginloading == false) {
                                            authViewModel.loginApi(
                                                data, context);
                                          }
                                        }
                                      },
                                      child: Container(
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
                                        child: value.loginloading == true
                                            ? const CircularProgressIndicator()
                                            : const Text(
                                                'Log-In',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.singup,
                                          );
                                        },
                                        child: text(
                                            title: "Sign-Up",
                                            color: Colors.black,
                                            fontsize: 17.0,
                                            fontweight: FontWeight.bold)),
                                  ],
                                );
                              }),
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
          color: const Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
