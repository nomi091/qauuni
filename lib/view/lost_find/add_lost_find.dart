import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/view_model/Items/upload_item_view_model.dart';
import 'package:dio/dio.dart' as dio;
import '../../utils/color.dart';
import '../../widgets/text.dart';

class AddFindLost extends StatefulWidget {
  const AddFindLost({super.key});

  @override
  State<AddFindLost> createState() => _AddFindLostState();
}

final myControllerName = TextEditingController();
final myControllerLocation = TextEditingController();
final myControllerPhone = TextEditingController();
final myControllerDetail = TextEditingController();
// bool isloading = false;
bool _passwordVisible = true;
final ImagePicker imagePicker = ImagePicker();
File? imageFile;

class _AddFindLostState extends State<AddFindLost> {
  @override
  void initState() {
    super.initState();
  }

  bool validData() {
    if (myControllerName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Enter Your Lost Item Name"),
      ));
      return false;
    }
    if (myControllerLocation.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Enter Your lost Item Location"),
      ));
      return false;
    }
    if (myControllerDetail.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Enter Some Details"),
      ));

      return false;
    }

    return true;
  }

  void clear() {
    myControllerDetail.clear();
    myControllerLocation.clear();
    myControllerName.clear();
    myControllerPhone.clear();
    imageFile = null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final uploadViewModel = Provider.of<UploadItemViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120), // Set this height
          child: SizedBox(
            height: 70,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: size.height,
              width: size.height,
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
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                      title: "Upload Lost Item",
                      fontsize: 25.0,
                      fontweight: FontWeight.bold,
                      color: Colors.black),
                  Container()
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: MediaQuery.of(context).viewInsets.bottom > 0
                        ? const EdgeInsets.only(top: 0)
                        : const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.03),
                        Center(
                          child: SizedBox(
                            width: size.width * .9,
                            height: size.height * 0.65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                component(
                                  //  icon: Icons.contacts,
                                  hintText: 'Lost Item Name',

                                  textediting: myControllerName,
                                ),
                                component(
                                  //  icon: Icons.contacts,
                                  hintText: 'Mobile Number',

                                  textediting: myControllerPhone,
                                ),
                                component(
                                  //  icon: Icons.contacts,
                                  hintText: 'Location',

                                  textediting: myControllerLocation,
                                ),

                                //Upload Image
                                Container(
                                  height: size.width / 8,
                                  width: size.width / 1.25,
                                  // height: size.height * ,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 199, 197, 197)
                                            .withOpacity(0.1),
                                        offset: const Offset(10.0, 8.0),
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  //Image code here
                                  child: InkWell(
                                    onTap: () {
                                      _getFromGallery();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            right: size.width / 30),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                                  255, 232, 229, 229)
                                              .withOpacity(.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 45.0),
                                              child: text(
                                                  title: imageFile == null
                                                      ? "Upload Lost Product"
                                                      : "Image selected ",
                                                  color: imageFile == null
                                                      ? const Color.fromARGB(
                                                          255, 222, 220, 220)
                                                      : Colors.white,
                                                  fontsize: 13.0,
                                                  fontweight:
                                                      FontWeight.normal),
                                            ),
                                            const Icon(
                                              Icons.upload,
                                              color: Colors.white,
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                // Recept image remeber change image list add new list to avoide over ride issue

                                //Select Print Side

                                component(
                                    //  icon: Icons.details_rounded,
                                    type: "detail",
                                    hintText: 'More Detail',
                                    textediting: myControllerDetail),

                                // ignore: avoid_unnecessary_containers
                                Consumer<UploadItemViewModel>(
                                    builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () async {
                                      if (validData()) {
                                        var data = dio.FormData.fromMap({
                                          'name': myControllerName.text,
                                          'location': myControllerLocation.text,
                                          'contact': myControllerPhone.text,
                                          'detail': myControllerDetail.text,
                                          'image':
                                              await dio.MultipartFile.fromFile(
                                                  imageFile!.path,
                                                  filename: imageFile!.path
                                                      .split('/')
                                                      .last)
                                        });
                                        if (value.uploadLoding == false) {
                                          uploadViewModel.uploadItemApis(
                                              data: data, context: context);
                                        }
                                        clear();
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: buttoncolor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child:
                                          // isloading
                                          //     ? const CircularProgressIndicator()
                                          //     :
                                          value.uploadLoding == true
                                              ? const CircularProgressIndicator()
                                              : const Text(
                                                  'Submit Orderss',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print("$imageFile");
      });
    }
  }

  Widget component({icon, hintText, textediting, type}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: type == "detail" ? size.width / 2 : size.width / 8,
      width: size.width / 1.25,
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.amber,
        color: const Color.fromARGB(255, 232, 229, 229).withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: TextField(
          textAlign: TextAlign.start,
          controller: textediting,
          maxLines: 40,
          style: const TextStyle(
            color: Colors.white,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white.withOpacity(.8),
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(.5),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
