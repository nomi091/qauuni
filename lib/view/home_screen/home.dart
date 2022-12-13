import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route.dart';
import '../../widgets/home_contaner.dart';
import '../../widgets/text.dart';
import '../drawer_screen/drawer.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  // List<ExploreModel> listItem = [];
  void initState() {
    // listItem = _searchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            key: _scaffoldkey,
            drawer: Container(
                //      color: Colors.amber,
                width: size.width * 0.7,
                child: const Drawer(child: DrawerData())),
            body: Stack(children: [
              Container(
                height: size.height,
                width: size.height,

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

                // width: 120.0,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/background.jpeg'),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: SizedBox(
                        // color: Colors.amber,
                        width: size.width * 0.87,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 214, 210, 210),
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 5,
                                    blurRadius: 20.0,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _scaffoldkey.currentState!.openDrawer();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color:
                                //         const Color.fromARGB(255, 214, 210, 210)
                                //             .withOpacity(0.2),
                                //     offset: Offset(2.0, 2.0),
                                //     spreadRadius: 5,
                                //     blurRadius: 20.0,
                                //   ),
                                // ],
                              ),
                              child: CircleAvatar(
                                radius: 22.0,
                                backgroundColor: Colors.white,
                                
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset('assets/logo2.png',width: 100,height: 100,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  text(
                      title: "Welcome To QAU",
                      fontsize: 25.0,
                      fontweight: FontWeight.bold,
                      color: Colors.black),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //        Get.to(const OnlineServices());
                  //       },
                  //       child: homeContaner(
                  //           size: size,
                  //           image: "delivery.png",
                  //           txt: "Online Services"),
                  //     ),
                  //     InkWell(
                  //       onTap: (){
                  //         Get.to(const AdmissionHome());
                  //       },
                  //       child: homeContaner(
                  //           size: size,
                  //           image: "adminInfo.png",
                  //           txt: "Admission Information"),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                        Get.toNamed(Routes.busPoint);
                        },
                        child: homeContaner(
                            size: size,
                            image: "bus.png",
                            txt: "Transport Service"),
                      ),
                      InkWell(
                        onTap: () {
                         Get.toNamed(Routes.lostFind);
                        },
                        child: homeContaner(
                            size: size,
                            image: "lost.png",
                            txt: "Lost & Found"),
                      ),
                    
                      // homeContaner(
                      //     size: size,
                      //     image: "kyc.png",
                      //     txt: "Past Papers"),
                    ],
                  ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     homeContaner(
                  //         size: size,
                  //         image: "noticebord.png",
                  //         txt: "Notice Bord"),
                  //     homeContaner(
                  //         size: size,
                  //         image: "update.png",
                  //         txt: "QAU Updates"),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     homeContaner(
                  //         size: size,
                  //         image: "merit.png",
                  //         txt: "QAU Marit List"),
                  //     homeContaner(
                  //         size: size,
                  //         image: "test.png",
                  //         txt: "QAU Entry Test"),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // homeContaner(
                  //     size: size,
                  //     image: "mental-health.png",
                  //     txt: "Lost & Found"),
                ]),
              )
            ])));
  }
}
