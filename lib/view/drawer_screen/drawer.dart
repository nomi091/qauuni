import 'package:flutter/material.dart';
import 'package:qauuni/routes/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/color.dart';
import '../../widgets/icon_text.dart';
import '../../widgets/text.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  void initState() {
    // getData();
    super.initState();
    print({userName, userAddress, userContact});
  }

  String userName = "";
  String userAddress = "";
  String userContact = "";

  // getData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     userName = pref.getString(
  //       "_name",
  //     )!;
  //     userAddress = pref.getString(
  //       "_address",
  //     )!;
  //     userContact = pref.getString(
  //       "_contact",
  //     )!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage('assets/logo2.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55, left: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: userName.toUpperCase(),
                              fontsize: 13.0,
                              color: black,
                              fontweight: FontWeight.bold),
                          text(
                              title: userAddress.toUpperCase(),
                              fontsize: 11.0,
                              color: black,
                              fontweight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                  //  alignment: Alignment.topLeft,
                  //       color: Colors.amber,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.aboutUs,
                          );
                        },
                        child: IconTextFun(
                            title: "About Us",
                            icon: Icons.info_outline_rounded,
                            fontColor: black,
                            iconColor: black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(ContactUs());
                          Navigator.pushNamed(
                            context,
                            Routes.contactUs,
                          );
                        },
                        child: IconTextFun(
                            title: "Contact Us",
                            icon: Icons.chat_bubble_outline_rounded,
                            fontColor: black,
                            iconColor: black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                           Navigator.pushNamed(
                            context,
                            Routes.terms,
                          );
                        },
                        child: IconTextFun(
                            title: "Terms & Conditions",
                            icon: Icons.person,
                            fontColor: black,
                            iconColor: black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.splash, (route) => false);
                        },
                        // Get.to(const Terms());

                        child: IconTextFun(
                            title: "Log Out",
                            icon: Icons.logout,
                            fontColor: black,
                            iconColor: black),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    ]);
  }
}
