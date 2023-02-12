import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/view_model/Items/found_item_view_model.dart';
import 'package:qauuni/view_model/Items/not_found_item_view_model.dart';
import 'package:qauuni/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/responce/status.dart';
import '../../res/app_urls.dart';
import '../../routes/route.dart';
import '../../utils/color.dart';
import '../../view_model/Items/my_item_view_model.dart';
import '../../widgets/button.dart';
import '../../widgets/pop_up.dart';

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
    myItemsViewModel.myItemData();
    getToken();
    super.initState();
  }

  var token;
  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool pressAttention = false;
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120), // Set this height
              child: SizedBox(
                height: 70,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: screenSize.height,
                  width: screenSize.height,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 137, 169, 245)),
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
                              Icons.arrow_back,
                              size: 25,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      text(
                          title: "Find and Lost",
                          fontsize: 25.0,
                          fontweight: FontWeight.bold,
                          color: Colors.black),
                      Container()
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: token == null
                ? Container()
                : FloatingActionButton(
                    backgroundColor: liteblue,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.addFindLost,
                      );
                      // Get.to(AddFindLost());
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(Icons.add),
                  ),
            key: _scaffoldkey,
            body: Stack(
              children: [
                Container(
                  height: screenSize.height,
                  width: screenSize.width,
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
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            width: screenSize.width * 0.30,
                            height: screenSize.height * 0.06,
                            fsize: 16.0,
                            bgColor: viewLost == true ? liteblue : Colors.white,
                            txtColor:
                                viewLost == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.01,
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
                            width: screenSize.width * 0.37,
                            height: screenSize.height * 0.06,
                            fsize: 16.0,
                            bgColor:
                                viewFound == true ? liteblue : Colors.white,
                            txtColor:
                                viewFound == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.01,
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
                            width: screenSize.width * 0.37,
                            height: screenSize.height * 0.06,
                            fsize: 16.0,
                            bgColor: viewFound == false && viewLost == false
                                ? liteblue
                                : Colors.white,
                            txtColor: viewFound == false && viewLost == false
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                viewLost == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 43.0),
                        child: ChangeNotifierProvider<
                                NotFoundItemsViewModel>.value(
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
                                      child: SingleChildScrollView(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    screenSize.height * 0.02,
                                              ),
                                              // viewAll == true
                                              //     ?
                                              ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  itemCount: value.itemData
                                                      .data!.items!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index)
                                                      //     =>
                                                      // (LostView(
                                                      //     indexPass: value
                                                      //         .founditemData
                                                      //         .data!
                                                      //         .items![index])),
                                                      {
                                                    return Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                // height: size.height * 0.2,
                                                                width: screenSize
                                                                        .width *
                                                                    0.95,
                                                                decoration: const BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10))),
                                                                // color: Colors.white,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20),
                                                                        // color: Colors.red,
                                                                        height:
                                                                            150,
                                                                        width:
                                                                            150,
                                                                        child: ClipRRect(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                            child: FadeInImage(
                                                                                placeholder: const AssetImage('assets/placeholder.png'),
                                                                                image: NetworkImage(
                                                                                  "${AppUrl.baseUrlImage}icon/${value.itemData.data!.items![index].image}",
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                                imageErrorBuilder: (context, object, trace) {
                                                                                  return Image.asset(
                                                                                    "assets/placeholder.png",
                                                                                    width: 40,
                                                                                    fit: BoxFit.cover,
                                                                                  );
                                                                                }))),
                                                                    const SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              12.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              const Icon(CupertinoIcons.rectangle_stack_badge_plus),
                                                                              Container(
                                                                                color: Colors.white,
                                                                                width: screenSize.width * 0.35,
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                child: Text(
                                                                                  value.itemData.data!.items![index].name.toString(),
                                                                                  textAlign: TextAlign.start,
                                                                                  overflow: TextOverflow.fade,
                                                                                  style: const TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.location_on),
                                                                              Container(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                width: screenSize.width * 0.4,
                                                                                child: Text(
                                                                                  value.itemData.data!.items![index].location.toString(),
                                                                                  overflow: TextOverflow.fade,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.phone),
                                                                              Container(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                width: screenSize.width * 0.4,
                                                                                child: Text(
                                                                                  value.itemData.data!.items![index].contact.toString(),
                                                                                  overflow: TextOverflow.clip,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.description),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 8.0),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    showDialog(
                                                                                      context: context,
                                                                                      builder: (_) => PopUpOverLay(indexPass: value.itemData.data!.items![index]),
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: screenSize.width * 0.25,
                                                                                    height: screenSize.height * 0.033,
                                                                                    decoration: const BoxDecoration(color: liteblue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                    child: const Center(
                                                                                      child: Text(
                                                                                        'Description',
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  })
                                            ],
                                          )));

                                //  return text(title: "Api Call success");
                              }
                              return Container();
                            })),
                      )
                    : viewFound == true
                        ? Padding(
                            padding: const EdgeInsets.only(top: 42.0),
                            child:
                                ChangeNotifierProvider<
                                        FoundItemsViewModel>.value(
                                    value: foundItemsViewModel,
                                    child: Consumer<FoundItemsViewModel>(
                                        builder: (context, value, index) {
                                      switch (value.founditemData.status) {
                                        case Status.Lodaing:
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        case Status.Error:
                                          return const Center(
                                              child: Text(
                                                  "Server Error please try again later"));
                                        case Status.Completed:
                                          return SingleChildScrollView(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    screenSize.height * 0.02,
                                              ),
                                              // viewAll == true
                                              //     ?
                                              ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  itemCount: value.founditemData
                                                      .data!.items!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index)
                                                      //     =>
                                                      // (LostView(
                                                      //     indexPass: value
                                                      //         .founditemData
                                                      //         .data!
                                                      //         .items![index])),
                                                      {
                                                    return Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                // height: size.height * 0.2,
                                                                width: screenSize
                                                                        .width *
                                                                    0.95,
                                                                decoration: const BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10))),
                                                                // color: Colors.white,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20),
                                                                        // color: Colors.red,
                                                                        height:
                                                                            150,
                                                                        width:
                                                                            150,
                                                                        child: ClipRRect(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                            child: FadeInImage(
                                                                                placeholder: const AssetImage('assets/placeholder.png'),
                                                                                image: NetworkImage(
                                                                                  "${AppUrl.baseUrlImage}icon/${value.founditemData.data!.items![index].image}",
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                                imageErrorBuilder: (context, object, trace) {
                                                                                  return Image.asset(
                                                                                    "assets/placeholder.png",
                                                                                    width: 40,
                                                                                    fit: BoxFit.cover,
                                                                                  );
                                                                                }))),
                                                                    const SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              12.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              const Icon(CupertinoIcons.rectangle_stack_badge_plus),
                                                                              Container(
                                                                                color: Colors.white,
                                                                                width: screenSize.width * 0.35,
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                child: Text(
                                                                                  value.founditemData.data!.items![index].name.toString(),
                                                                                  textAlign: TextAlign.start,
                                                                                  overflow: TextOverflow.fade,
                                                                                  style: const TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.location_on),
                                                                              Container(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                width: screenSize.width * 0.4,
                                                                                child: Text(
                                                                                  value.founditemData.data!.items![index].location.toString(),
                                                                                  overflow: TextOverflow.fade,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.phone),
                                                                              Container(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                width: screenSize.width * 0.4,
                                                                                child: Text(
                                                                                  value.founditemData.data!.items![index].contact.toString(),
                                                                                  overflow: TextOverflow.clip,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(Icons.description),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 8.0),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    showDialog(
                                                                                      context: context,
                                                                                      builder: (_) => PopUpOverLay(indexPass: value.founditemData.data!.items![index]),
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: screenSize.width * 0.25,
                                                                                    height: screenSize.height * 0.033,
                                                                                    decoration: const BoxDecoration(color: liteblue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                    child: const Center(
                                                                                      child: Text(
                                                                                        'Description',
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  })
                                            ],
                                          ));

                                        //  return text(title: "Api Call success");
                                      }
                                      return Container();
                                    })),
                          )
                        : (viewFound == false && viewLost == false)
                            ? token == null
                                ? const Center(
                                    child: Text(
                                        "Please login to access this feature"))
                                : Padding(
                                    padding: const EdgeInsets.only(top: 48.0),
                                    child:
                                        ChangeNotifierProvider<
                                                MyItemsViewModel>.value(
                                            value: myItemsViewModel,
                                            child: Consumer<MyItemsViewModel>(
                                                builder:
                                                    (context, value, index) {
                                              switch (value.myitemData.status) {
                                                case Status.Lodaing:
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                case Status.Error:
                                                  return const Center(
                                                      child: Text(
                                                          "server error please try again later"));
                                                case Status.Completed:
                                                  return Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                            // physics:
                                                            //     const NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            primary: false,
                                                            itemCount: value
                                                                .myitemData
                                                                .data!
                                                                .items!
                                                                .length,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child: value
                                                                            .myitemData
                                                                            .data!
                                                                            .items![
                                                                                index]
                                                                            .status ==
                                                                        "1"
                                                                    ? Container()
                                                                    : Stack(
                                                                        children: [
                                                                            Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Center(
                                                                                  child: Container(
                                                                                    // height: size.height * 0.2,
                                                                                    width: screenSize.width * 0.95,
                                                                                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                    // color: Colors.white,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                            padding: const EdgeInsets.only(left: 20),
                                                                                            // color: Colors.red,
                                                                                            height: 150,
                                                                                            width: 150,
                                                                                            child: ClipRRect(
                                                                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                                child: FadeInImage(
                                                                                                    placeholder: const AssetImage('assets/placeholder.png'),
                                                                                                    image: NetworkImage(
                                                                                                      "${AppUrl.baseUrlImage}icon/${value.myitemData.data!.items![index].image}",
                                                                                                    ),
                                                                                                    fit: BoxFit.cover,
                                                                                                    imageErrorBuilder: (context, object, trace) {
                                                                                                      return Image.asset(
                                                                                                        "assets/placeholder.png",
                                                                                                        width: 40,
                                                                                                        fit: BoxFit.cover,
                                                                                                      );
                                                                                                    }))),
                                                                                        const SizedBox(
                                                                                          width: 20,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(top: 12.0),
                                                                                          child: Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  const Icon(CupertinoIcons.rectangle_stack_badge_plus),
                                                                                                  Container(
                                                                                                    color: Colors.white,
                                                                                                    width: screenSize.width * 0.35,
                                                                                                    padding: const EdgeInsets.only(left: 10),
                                                                                                    child: Text(
                                                                                                      value.myitemData.data!.items![index].name.toString(),
                                                                                                      textAlign: TextAlign.start,
                                                                                                      overflow: TextOverflow.fade,
                                                                                                      style: const TextStyle(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                              Row(
                                                                                                children: [
                                                                                                  const Icon(Icons.location_on),
                                                                                                  Container(
                                                                                                    padding: const EdgeInsets.only(left: 10),
                                                                                                    width: screenSize.width * 0.4,
                                                                                                    child: Text(
                                                                                                      value.myitemData.data!.items![index].location.toString(),
                                                                                                      overflow: TextOverflow.fade,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                              Row(
                                                                                                children: [
                                                                                                  const Icon(Icons.phone),
                                                                                                  Container(
                                                                                                    padding: const EdgeInsets.only(left: 10),
                                                                                                    width: screenSize.width * 0.4,
                                                                                                    child: Text(
                                                                                                      value.myitemData.data!.items![index].contact.toString(),
                                                                                                      // indexPass.contact.toString(),
                                                                                                      overflow: TextOverflow.clip,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                              Row(
                                                                                                children: [
                                                                                                  const Icon(Icons.description),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 8.0),
                                                                                                    child: InkWell(
                                                                                                      onTap: () {
                                                                                                        showDialog(
                                                                                                          context: context,
                                                                                                          builder: (_) => PopUpOverLay(indexPass: value.myitemData.data!.items![index]),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: screenSize.width * 0.25,
                                                                                                        height: screenSize.height * 0.033,
                                                                                                        decoration: const BoxDecoration(color: liteblue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                                        child: const Center(
                                                                                                          child: Text(
                                                                                                            'Description',
                                                                                                            style: TextStyle(color: Colors.white),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                                                                              alignment: Alignment.topRight,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  showDialog<String>(
                                                                                    context: context,
                                                                                    builder: (BuildContext context) => Container(
                                                                                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                                      child: AlertDialog(
                                                                                        title: const Text('Please Confirm'),
                                                                                        content: const Text('Are you sure you want to make this item mark as found.'),
                                                                                        actions: <Widget>[
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(context, 'Cancel'),
                                                                                            child: text(title: 'Cancel', color: Colors.red, fontsize: 14.0, fontweight: FontWeight.bold),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () {
                                                                                              myItemsViewModel.markFoundMyItem();
                                                                                              Navigator.pushNamed(
                                                                                                context,
                                                                                                Routes.lostFind,
                                                                                              );
                                                                                              // Navigator.pop(context, 'OK');
                                                                                            },
                                                                                            child: text(title: 'Ok', color: Colors.green, fontsize: 14.0, fontweight: FontWeight.bold),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: const Icon(
                                                                                  CupertinoIcons.checkmark_alt_circle,
                                                                                  size: 30,
                                                                                  color: Colors.green,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ]),
                                                              );
                                                            }
                                                            //     =>
                                                            // ( value.myitemData
                                                            // .data!.items![index].status=="1"?Container(height: 10,width: 10,color: Colors.red,):MyItemView(
                                                            //     indexPass: value
                                                            //             .myitemData
                                                            //             .data!
                                                            //             .items![
                                                            //         index])),
                                                            ),
                                                      )
                                                    ],
                                                  );
                                              }
                                              return Container();
                                            })),
                                  )
                            : const Center(child: CircularProgressIndicator())
              ],
            )));
  }
}
