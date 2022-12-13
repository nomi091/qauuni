import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/view/bus_point/point_view.dart';
import '../../data/responce/status.dart';
import '../../view_model/shift_data_view_model.dart';
import '../../widgets/text.dart';

class BusPoint extends StatefulWidget {
  const BusPoint({super.key,});

  @override
  State<BusPoint> createState() => _BusPointState();
}

class _BusPointState extends State<BusPoint> {
  ShiftDataViewModel shiftDataViewModel = ShiftDataViewModel();
  @override
  void initState() {
    shiftDataViewModel.getBusShit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider<ShiftDataViewModel>(
                create: (_) => shiftDataViewModel,
                child: Consumer<ShiftDataViewModel>(
                    builder: (context, value, _) {
                  switch (value.shiftData.status) {
                    case Status.Lodaing:
                      return const Center(child:  CircularProgressIndicator());
                    case Status.Error:
                      return const Center(child:  Text("Please check your internet and try again"));
                    case Status.Completed:
                      // return text(title: value.shiftData.data!.data.toString());
                      return Stack(children: [
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
                                        text(
                                            title: "Point Schedule",
                                            fontsize: 25.0,
                                            fontweight: FontWeight.bold,
                                            color: Colors.black),
                                             
                                        Container()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              SizedBox(
                                width: size.width * 0.95,
                                child: value.shiftData.data == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : GridView.builder(
                                        physics: const ScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: value.shiftData.data!.data!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          // childAspectRatio: 12.0,
                                          mainAxisExtent: 150,
                                          maxCrossAxisExtent: 180,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return (PointView(
                                              indexPass: value.shiftData.data!.data![index]));

                                        }),
                              )
                            ]))
                      ]);
                 
                  }
                  return Container();
                }))));
  
  }
}
