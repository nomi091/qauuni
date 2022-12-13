import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/color.dart';
import '../../widgets/text.dart';

class AddFindLost extends StatefulWidget {
  const AddFindLost({super.key});

  @override
  State<AddFindLost> createState() => _AddFindLostState();
}

final myControllerEmail = TextEditingController();
final myControllerPassword = TextEditingController();
final myControllerPhone= TextEditingController();
bool isloading = false;
bool _passwordVisible = true;
final ImagePicker imagePicker = ImagePicker();
// List<File>? imageFileList = [];
 File? imageFile;
// String dropdownValue = 'Single';

class _AddFindLostState extends State<AddFindLost> {
  void initState() {
    super.initState();
  }
  //  @override
  //    void dispose() {
  //     // Clean up the controller when the widget is disposed.
  //     myControllerEmail.dispose();
  //     myControllerPassword.dispose();
  //     myControllerPhone.dispose();
  //     super.dispose();
  //   }
    
     bool validData() {
       if (myControllerPassword.text.isNotEmpty &&
          myControllerPassword.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Valid Password"),
        ));
        return false;
      }
      if (myControllerPassword.text.isNotEmpty &&
          myControllerPassword.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Valid Password"),
        ));
        return false;
      }
      if (myControllerPhone.text.isNotEmpty &&
          myControllerPassword.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Valid Password"),
        ));
        return false;
      }
      return true;
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
 

   
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255)
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 214, 210, 210)
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
                  Padding(
                    padding: MediaQuery.of(context).viewInsets.bottom > 0
                        ? EdgeInsets.only(top: 0)
                        : EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0, top: 20),
                          child: Text(
                            'Upload Lost Item',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: black.withOpacity(.8),
                            ),
                          ),
                        ),
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
                                  hintText: 'Mobile Number',
                                  isPassword: false,
                                  isEmail: true,
                                  textediting: myControllerEmail,
                                ),
                                component(
                                  //  icon: Icons.contacts,
                                  hintText: 'Location',
                                  isPassword: false,
                                  isEmail: true,
                                  textediting: myControllerEmail,
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
                                        offset: Offset(10.0, 8.0),
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
                                          color:
                                              Color.fromARGB(255, 232, 229, 229)
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
                                                  title: "Upload Lost Product",
                                                  color: Colors.white
                                                      .withOpacity(0.5),
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
                                    hintText: 'More Detail',
                                    isEmail: false,
                                    isPassword: true,
                                    textediting: myControllerPassword),

                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  // onTap: () {
                                  //   setState(() {
                                  //     isloading = true;
                                  //   });
                                  //   if (validData() == true) {
                                  //     loginApis(
                                  //             email: myControllerEmail.text,
                                  //             password:
                                  //                 myControllerPassword.text,
                                  //             context: context)
                                  //         .then((value) => {
                                  //               setState(() {
                                  //                 isloading = false;
                                  //               }),
                                  //             });
                                  //   } else {
                                  //     setState(() {
                                  //       isloading = false;
                                  //     });
                                  //   }
                                  // },
                                  child: Container(
                                    //color: Colors.amber,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: size.width * .05,
                                          ),
                                          height: size.width / 8,
                                          width: size.width / 1.25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: buttoncolor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            'Submit Orderss',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


File? image;
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on Exception catch(e) {
      print('Failed to pick image: $e');
    }
  }

_getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
         imageFile = File(pickedFile.path);
    }
}

// late String _path;
// late Map<String, String> _paths;
// late String _extension;
// late FileType _pickType;
// bool _multiPick = false;
// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
// // final List<StorageUploadTask> _tasks = <StorageUploadTask>[];
//   pickMultipleImage() async {
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(allowMultiple: true,
//        );
//     if (result != null) {
//       List<File> files = result.paths.map((path) => File(path!)).toList();

//     } else {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("File is not uploaded"),
//         ));
//     }
//   }

// uploadToFirebase() {
//     if (_multiPick) {
//         _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
//     } else {
//         String fileName = _path.split('/').last;
//         String filePath = _path;
//         upload(fileName, filePath);
//     }
// }

// upload(fileName, filePath) {
//     _extension = fileName.toString().split('.').last;
//     StorageReference storageRef =
//         FirebaseStorage.instance.ref().child(fileName);
//     final StorageUploadTask uploadTask = storageRef.putFile(
//         File(filePath),
//         StorageMetadata(
//         contentType: '$_pickType/$_extension',
//         ),
//     );
//     setState(() {
//         _tasks.add(uploadTask);
//     });
// }

  Widget component({icon, hintText, isPassword, isEmail, textediting}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.amber,
        color: Color.fromARGB(255, 232, 229, 229).withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: TextField(
          textAlign: TextAlign.start,
          controller: textediting,
          style: TextStyle(
            color: Color.fromARGB(255, 196, 190, 190).withOpacity(.9),
          ),
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
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
