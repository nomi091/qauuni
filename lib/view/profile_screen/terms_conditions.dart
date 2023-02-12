import 'package:flutter/material.dart';
import 'package:qauuni/utils/color.dart';

import '../../widgets/text.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 137, 169, 245),
              Color.fromARGB(255, 200, 13, 220),
            ],
          ),
        ),
        child: Column(children: [
          SizedBox(
            width: size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                text(
                    title: "Terms and Conditions",
                    fontsize: 20.0,
                    fontweight: FontWeight.bold,
                    color: const Color.fromARGB(255, 15, 5, 5)),
                Container()
              ],
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            /** Card Widget **/
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.white,
              child: SizedBox(
                width: 300,
                height: size.height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: white,
                        radius: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            // backgroundImage: AssetImage(
                            //   "assets/images/iconTop.png",
                            // ),

                            // backgroundImage: NetworkImage(
                            //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                            radius: 60,
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                              height: 100,
                            )), //CircleAvatar
                      ), //CircleAvatar

                      SizedBox(
                        height: 1,
                      ), //SizedBoxF
                      Text(
                        '1. You have to Login to upload your lost Items.',

                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 13,
                          color: Colors.black,
                          // overflow:TextOverflow.visible
                        ), //Textstyle
                      ), //Text
                        SizedBox(
                        height: 3,
                      ), //S
                      Text(
                        '2. In Case of any Lost Item recovery our team will not responsible.',
                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ), //
                        SizedBox(
                        height: 5,
                      ), //S
                       Text(
                        '3. The General Terms and any Additional Terms may be updated by us from time to time.',
                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ), //Card
          ), //
        ]),
      )),
    );
  }
}
