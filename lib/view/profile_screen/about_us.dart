import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/color.dart';
import '../../widgets/text.dart';


class AboutUs extends StatefulWidget {
   AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Column(children: [
            Container(
          width: size.width*0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 214, 210, 210),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 9.0,
                    ),
                  ],
                ),
                child:  CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: white,
                    ),
                    onPressed: () {
                      // Get.to(Navbar());
                    },
                  ),
                ),
              ),
              text(
                  title: "About Us",
                  fontsize: 20.0,
                  fontweight: FontWeight.normal,
                  color: const Color.fromARGB(255, 15, 5, 5)),
              const Image(image: AssetImage('assets/images/logo.png'),height: 40,),
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
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: white,
                      radius: 50,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
    
                          // backgroundImage: NetworkImage(
                          //     "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                          radius: 100,
                          child: Image(
                            image: AssetImage('assets/logo.png'),
                            height: 100,
                          )), //CircleAvatar
                    ), //CircleAvatar
    
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Rental Car is a division of Rental Motors Moesha Limited designed to simplify the renting of Cars in Pakistan.filter the results according to your needs all within the app. ',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 15,
                        color: Colors.black,
                        // overflow:TextOverflow.visible
                      ), //Textstyle
                    ), 
                      Text(
                      'Rental Car does not own any of the properties listed and we are responsible for any drivers you taken from us We do encourage you to report any suspicious activities to us so we can take the necessary bugs in the app.Go ahead and get new car for rent. Happy searching',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 15,
                        color: Colors.black,
                        // overflow:TextOverflow.visible
                      ), //Textstyle
                    ),//Text
                    //SizedBox
                    //SizedBox
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ), //Card
            ), //
          ]),
        ),
      ),
    );
  }
}
