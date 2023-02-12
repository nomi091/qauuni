import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../widgets/text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
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
                      title: "About Us",
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  /** Card Widget **/
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: SizedBox(
                      width: 350,
                      // height: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundColor: white,
                              radius: 50,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 100,
                                  child: Image(
                                    image: AssetImage('assets/logo.png'),
                                    height: 100,
                                  )), //CircleAvatar
                            ), //CircleAvatar
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                           
                                const Text(
                                  'This is an App Created for only QAU students, which Contain All information about transport, like the timing of departure bus numbers routes along lost and find item options  QAU App helps all the students easily. In QAU App, from time to time, there will be more amazig updates.',
                                  style: TextStyle(
                                    // letterSpacing: 0.2,
                                    fontSize: 15,
                                    color: Colors.black,

                                    // overflow:TextOverflow.visible
                                  ), //Textstyle
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                const Text(
                                  "This application has many Modules, two of them were launched in 2023. Our basic aim is to facilitate Quadian's transport issue; our app helps them find their Bus of proper route.  Our app also provides information on Lost and found Items in the University area.This App is developed by Digital smart solution for QAU students,and a team of  active students work",
                                  textAlign: TextAlign.justify,

                                  style: TextStyle(
                                    letterSpacing: 0.1,

                                    fontSize: 15,
                                    color: Colors.black,
                                    // overflow:TextOverflow.visibleß
                                  ), //Textstyle
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Development Team ',
                                  textAlign: TextAlign.justify,

                                  style: TextStyle(
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                    // overflow:TextOverflow.visibleß
                                  ), //Textstyle
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                text(
                                    title: 'Shah Ahad (Founder and CEO)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),
                                const SizedBox(
                                  height: 5,
                                ),
                                text(
                                    title:
                                        'Subhan Ullah (Senior PHP Developer)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),
                                const SizedBox(
                                  height: 5,
                                ),
                                text(
                                    title: 'Lal Zaib Ali  (IT specialist)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),
                                const SizedBox(
                                  height: 5,
                                ),

                                text(
                                    title:
                                        'Noman Hassan (Senior Flutter Developer)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),

                                const SizedBox(
                                  height: 5,
                                ),
                                text(
                                    title:
                                        'Zeeshan Ahmed (Senior Content Creator)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),
                                const SizedBox(
                                  height: 5,
                                ),
                                text(
                                    title: 'Umar Bin Ijaz (Laravel developer)',
                                    fontsize: 15.0,
                                    fontweight: FontWeight.normal),
                              ],
                            )
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ), //Card
                ),
              ),
            ), //
          ]),
        ),
      ),
    );
  }
}
