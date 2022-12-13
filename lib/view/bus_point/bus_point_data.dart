import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/responce/status.dart';
import '../../view_model/bus_route_data_model.dart';
import '../../widgets/text.dart';

class BusPointData extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final indexPass;
  const BusPointData({super.key,this.indexPass});
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<BusPointData> {
  BusRouteViewModel busRouteViewModel = BusRouteViewModel();
  @override
  void initState() {
    // print(widget.indexPass);
    busRouteViewModel.getBusRouteData(widget.indexPass);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider<BusRouteViewModel>(
                create: (_) => busRouteViewModel,
                child:
                    Consumer<BusRouteViewModel>(builder: (context, value, _) {
                  switch (value.busRouteData.status) {
                    case Status.Lodaing:
                      return const Center(child: CircularProgressIndicator());
                    case Status.Error:
                      return const Center(
                          child: Text("Please check your internet and try again"));
                    case Status.Completed:
                      // return ListView.builder(
                      //   itemCount: value.busRouteData.data!.data!.length,
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         text(
                      //             title: value.busRouteData.data!.data.toString()),
                      //               text(
                      //             title: value.busRouteData.data!.data![index].busNumber),
                      //       ],
                      //     );
                      //   },
                      // );
                      return MaterialApp(
                          home: Scaffold(
                              body: Stack(children: [
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(1),
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
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:40.0),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.busRouteData.data!.data!.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                      defaultColumnWidth:
                                          const FixedColumnWidth(100.0),
                                      border: const TableBorder(
                                          horizontalInside: BorderSide(
                                              width: 1,
                                              color: Colors.black,
                                              style: BorderStyle.solid)),
                                      children: [
                                        //Header
                                        TableRow(children: [
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Bus',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Route',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Stand',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Full Detail',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Status',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: 'Departure',
                                                  fontsize: 20.0,
                                                  fontweight: FontWeight.bold)
                                            ],
                                          ),
                                        ]),
                                        //1
                                        TableRow(children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: text(
                                                    title: value
                                                        .busRouteData
                                                        .data!
                                                        .data![index]
                                                        .busNumber,
                                                    fontsize: 20.0,
                                                    fontweight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: text(
                                                    title: value
                                                        .busRouteData
                                                        .data!
                                                        .data![index]
                                                        .routeDetails
                                                        .toString(),
                                                    fontsize: 15.0,
                                                    fontweight: FontWeight.normal,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: text(
                                                    title: value.busRouteData
                                                        .data!.data![index].stand
                                                        .toString(),
                                                    fontsize: 15.0,
                                                    fontweight: FontWeight.normal,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Container(
                                                  // height: size.height * 0.04,
                                                  // width: size.width * 0.2,
                                                  color: Colors.red,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      text(
                                                          title: 'View Pdf',
                                                          fontsize: 15.0,
                                                          fontweight:
                                                              FontWeight.normal,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              233, 227, 227)),
                                                      const Icon(
                                                        Icons
                                                            .arrow_circle_right_outlined,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0),
                                                    child: Container(
                                                      // height: size.height * 0.04,
                                                      width: size.width * 0.2,
                                                      color: Colors.black,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          value
                                                                      .busRouteData
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .status ==
                                                                  'active'
                                                              ? Icon(
                                                                  Icons.circle,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Icon(
                                                                  Icons.circle,
                                                                  color: Colors
                                                                      .yellow,
                                                                ),
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.red,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              text(
                                                  title: value.busRouteData.data!
                                                      .data![index].departure,
                                                  fontsize: 15.0,
                                                  fontweight: FontWeight.normal,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ]),
                                      ]),
                                );
                              }),
                        )
                      ])));
                  }
                  return Container();
                }))));
  }
}
