import 'package:flutter/material.dart';
import 'package:qauuni/utils/color.dart';

import '../../widgets/text.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Scaffold(
          body: Container(
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
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
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
                        title: "Contact Us",
                        fontsize: 20.0,
                        fontweight: FontWeight.bold,
                        color: const Color.fromARGB(255, 15, 5, 5)),
                    Container(
                      width: 60,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                /** Card Widget **/
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: SizedBox(
                    width: 320,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: white,
                            radius: 50,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,

                                // backgroundImage: NetworkImage(
                                //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                                radius: 100,
                                child: Image(
                                  image: AssetImage('assets/logo2.png'),
                                  height: 100,
                                )), //CircleAvatar
                          ), //CircleAvatar

                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // text(
                              //     title: ' For any suggestion or help',
                              //     fontsize: 14.0,
                              //     fontweight: FontWeight.w600),
                              const SizedBox(
                                height: 10,
                              ),
                              text(
                                  title: 'Facebook: QUA Services Offical',
                                  fontsize: 14.0,
                                  fontweight: FontWeight.w600),
                              const SizedBox(
                                height: 10,
                              ),
                              text(
                                  title: 'Email: qauonlineservices@gmail.com',
                                  fontsize: 14.0,
                                  fontweight: FontWeight.w600),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ), //Card
              ), //
            ]),
          ),
        ),
      ),
    );
  }
}
