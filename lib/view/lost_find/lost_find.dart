import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/view/lost_find/lost_view.dart';
import 'package:qauuni/view_model/found_item_view_model.dart';
import 'package:qauuni/view_model/not_found_item_view_model.dart';
import '../../data/responce/status.dart';
import '../../utils/color.dart';
import '../../view_model/my_item_view_model.dart';
import '../../widgets/button.dart';
import 'add_lost_find.dart';

class LostFind extends StatefulWidget {
  const LostFind({super.key});

  @override
  State<LostFind> createState() => _LostFindState();
}

GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

class _LostFindState extends State<LostFind> {
  bool viewLost = true;
  bool viewFound = false;

  NotFoundItemsViewModel notFoundItemsViewModel = NotFoundItemsViewModel();
  FoundItemsViewModel foundItemsViewModel = FoundItemsViewModel();
  MyItemsViewModel myItemsViewModel = MyItemsViewModel();

  @override
  void initState() {
    notFoundItemsViewModel.getNotFoundItemData();
    foundItemsViewModel.getFoundItemData();
    myItemsViewModel.myItemData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool pressAttention = false;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: liteblue,
              onPressed: () {
                Get.to(AddFindLost());
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(Icons.add),
            ),
            key: _scaffoldkey,
            body: viewLost == true
                ? ChangeNotifierProvider<NotFoundItemsViewModel>.value(
                    value: notFoundItemsViewModel,
                    child: Consumer<NotFoundItemsViewModel>(
                        builder: (context, value, index) {
                      switch (value.itemData.status) {
                        case Status.Lodaing:
                          return const Center(
                              child: CircularProgressIndicator());
                        case Status.Error:
                          return const Center(
                              child: Text(
                                  "Please check your internet and try again"));
                        case Status.Completed:
                          return SingleChildScrollView(
                              child: Stack(
                            children: [
                              Container(
                                height: size.height,
                                width: size.height,
                                // width: 120.0,
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
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                      child: Container(
                                        // color: Colors.amber,
                                        width: size.width * 0.87,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 214, 210, 210),
                                                    offset: Offset(2.0, 2.0),
                                                    spreadRadius: 5,
                                                    blurRadius: 20.0,
                                                  ),
                                                ],
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.arrow_back,
                                                    size: 25,
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Find and Lost',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: black.withOpacity(.8),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color.fromARGB(
                                                            255, 214, 210, 210)
                                                        .withOpacity(0.2),
                                                    offset: Offset(2.0, 2.0),
                                                    spreadRadius: 5,
                                                    blurRadius: 20.0,
                                                  ),
                                                ],
                                              ),
                                              // child: Image.asset(
                                              //   'assets/logoQA.jpg',
                                              //   height: 30,
                                              //   width: 30,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              viewLost = true;
                                              viewFound = false;
                                            });
                                          },
                                          child: button(
                                            title: "Lost Items",
                                            width: size.width * 0.30,
                                            height: size.height * 0.06,
                                            fsize: 16.0,
                                            bgColor: viewLost == true
                                                ? liteblue
                                                : Colors.white,
                                            txtColor: viewLost == true
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              viewLost = false;
                                              viewFound = true;
                                            });
                                          },
                                          child: button(
                                            title: "Found Items",
                                            width: size.width * 0.37,
                                            height: size.height * 0.06,
                                            fsize: 16.0,
                                            bgColor: viewFound == true
                                                ? liteblue
                                                : Colors.white,
                                            txtColor: viewFound == true
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              viewLost = false;
                                              viewFound = false;
                                            });
                                          },
                                          child: button(
                                            title: "My Items",
                                            width: size.width * 0.37,
                                            height: size.height * 0.06,
                                            fsize: 16.0,
                                            bgColor: viewFound == false &&
                                                    viewLost == false
                                                ? liteblue
                                                : Colors.white,
                                            txtColor: viewFound == false &&
                                                    viewLost == false
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  // viewAll == true
                                  //     ?
                                  GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount:
                                        value.itemData.data!.items!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0,
                                      mainAxisExtent: 170,
                                      maxCrossAxisExtent: 400,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            (LostView(
                                                itemtype: '',
                                                indexPass: value.itemData.data!
                                                    .items![index])),
                                  )
                                ],
                              )
                            ],
                          ));

                        //  return text(title: "Api Call success");
                      }
                      return Container();
                    }))
                : viewFound == true
                    ? ChangeNotifierProvider<FoundItemsViewModel>.value(
                        value: foundItemsViewModel,
                        child: Consumer<FoundItemsViewModel>(
                            builder: (context, value, index) {
                          switch (value.founditemData.status) {
                            case Status.Lodaing:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case Status.Error:
                              return const Center(
                                  child: Text(
                                      "Please check your internet and try again"));
                            case Status.Completed:
                              return SingleChildScrollView(
                                  child: Stack(
                                children: [
                                  Container(
                                    height: size.height,
                                    width: size.height,
                                    // width: 120.0,
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
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Center(
                                          child: Container(
                                            // color: Colors.amber,
                                            width: size.width * 0.87,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 214, 210, 210),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                        spreadRadius: 5,
                                                        blurRadius: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 255, 255, 255),
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.arrow_back,
                                                        size: 25,
                                                        color: Colors.black,
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Find and Lost',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        black.withOpacity(.8),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                214,
                                                                210,
                                                                210)
                                                            .withOpacity(0.2),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                        spreadRadius: 5,
                                                        blurRadius: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                  // child: Image.asset(
                                                  //   'assets/logoQA.jpg',
                                                  //   height: 30,
                                                  //   width: 30,
                                                  // ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  viewLost = true;
                                                  viewFound = false;
                                                });
                                              },
                                              child: button(
                                                title: "Lost Items",
                                                width: size.width * 0.30,
                                                height: size.height * 0.06,
                                                fsize: 16.0,
                                                bgColor: viewLost == true
                                                    ? liteblue
                                                    : Colors.white,
                                                txtColor: viewLost == true
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  viewLost = false;
                                                  viewFound = true;
                                                });
                                              },
                                              child: button(
                                                title: "Found Items",
                                                width: size.width * 0.37,
                                                height: size.height * 0.06,
                                                fsize: 16.0,
                                                bgColor: viewFound == true
                                                    ? liteblue
                                                    : Colors.white,
                                                txtColor: viewFound == true
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  viewLost = false;
                                                  viewFound = false;
                                                });
                                              },
                                              child: button(
                                                title: "My Items",
                                                width: size.width * 0.37,
                                                height: size.height * 0.06,
                                                fsize: 16.0,
                                                bgColor: viewFound == false &&
                                                        viewLost == false
                                                    ? liteblue
                                                    : Colors.white,
                                                txtColor: viewFound == false &&
                                                        viewLost == false
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      // viewAll == true
                                      //     ?
                                      GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: value
                                            .founditemData.data!.items!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 1.0,
                                          // childAspectRatio: 12.0,
                                          mainAxisExtent: 170,
                                          maxCrossAxisExtent: 400,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                (LostView(
                                                    itemtype: '',
                                                    indexPass: value
                                                        .founditemData
                                                        .data!
                                                        .items![index])),
                                      )
                                    ],
                                  )
                                ],
                              ));

                            //  return text(title: "Api Call success");
                          }
                          return Container();
                        }))
                    : (viewFound == false && viewLost == false)
                        ? ChangeNotifierProvider<MyItemsViewModel>.value(
                            value: myItemsViewModel,
                            child: Consumer<MyItemsViewModel>(
                                builder: (context, value, index) {
                              switch (value.myitemData.status) {
                                case Status.Lodaing:
                                  return const Center(
                                      child: CircularProgressIndicator());
                                case Status.Error:
                                  return const Center(
                                      child: Text(
                                          "Please check your internet and try again"));
                                case Status.Completed:
                                  return SingleChildScrollView(
                                      child: Stack(
                                    children: [
                                      Container(
                                        height: size.height,
                                        width: size.height,
                                        // width: 120.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromARGB(
                                                  255, 137, 169, 245),
                                              Color.fromARGB(255, 200, 13, 220),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Center(
                                              child: Container(
                                                // color: Colors.amber,
                                                width: size.width * 0.87,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    214,
                                                                    210,
                                                                    210),
                                                            offset: Offset(
                                                                2.0, 2.0),
                                                            spreadRadius: 5,
                                                            blurRadius: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255),
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.arrow_back,
                                                            size: 25,
                                                            color: Colors.black,
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Find and Lost',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: black
                                                            .withOpacity(.8),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    214,
                                                                    210,
                                                                    210)
                                                                .withOpacity(
                                                                    0.2),
                                                            offset: Offset(
                                                                2.0, 2.0),
                                                            spreadRadius: 5,
                                                            blurRadius: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                      // child: Image.asset(
                                                      //   'assets/logoQA.jpg',
                                                      //   height: 30,
                                                      //   width: 30,
                                                      // ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      viewLost = true;
                                                      viewFound = false;
                                                    });
                                                  },
                                                  child: button(
                                                    title: "Lost Items",
                                                    width: size.width * 0.30,
                                                    height: size.height * 0.06,
                                                    fsize: 16.0,
                                                    bgColor: viewLost == true
                                                        ? liteblue
                                                        : Colors.white,
                                                    txtColor: viewLost == true
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      viewLost = false;
                                                      viewFound = true;
                                                    });
                                                  },
                                                  child: button(
                                                    title: "Found Items",
                                                    width: size.width * 0.37,
                                                    height: size.height * 0.06,
                                                    fsize: 16.0,
                                                    bgColor: viewFound == true
                                                        ? liteblue
                                                        : Colors.white,
                                                    txtColor: viewFound == true
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      viewLost = false;
                                                      viewFound = false;
                                                    });
                                                  },
                                                  child: button(
                                                    title: "My Items",
                                                    width: size.width * 0.37,
                                                    height: size.height * 0.06,
                                                    fsize: 16.0,
                                                    bgColor: viewFound ==
                                                                false &&
                                                            viewLost == false
                                                        ? liteblue
                                                        : Colors.white,
                                                    txtColor: viewFound ==
                                                                false &&
                                                            viewLost == false
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          // viewAll == true
                                          //     ?
                                          GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: value
                                                .myitemData.data!.items!.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                              mainAxisSpacing: 1.0,
                                              crossAxisSpacing: 1.0,
                                              // childAspectRatio: 12.0,
                                              mainAxisExtent: 170,
                                              maxCrossAxisExtent: 400,
                                            ),
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                (LostView(
                                                    itemtype: 'MyItem',
                                                    indexPass: value.myitemData
                                                        .data!.items![index])),
                                          )
                                        ],
                                      )
                                    ],
                                  ));
                              }
                              return Container();
                            }))
                        : Center(child: CircularProgressIndicator())));
  }
}
