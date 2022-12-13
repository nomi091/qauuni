import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qauuni/view_model/my_item_view_model.dart';

import '../../utils/color.dart';
import '../../widgets/icon_text.dart';
import '../../widgets/pop_up.dart';
import '../../widgets/text.dart';

class LostView extends StatelessWidget {
  final indexPass;
  var itemtype;

  LostView({Key? key, required this.indexPass, required this.itemtype})
      : super(key: key);
  MyItemsViewModel myItemsViewModel = MyItemsViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    // height: size.height * 0.2,
                    width: size.width * 0.95,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          // color: Colors.red,
                          height: 150,
                          width: 150,
                          child: Image.network(
                              //"https://aremo8+rch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
                              "https://qiu.globalasias.com/icon/${indexPass.image}",
                              //  url+image[0]['image_name'],
                              width: size.width * 0.3,
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(CupertinoIcons
                                      .rectangle_stack_badge_plus),
                                  Container(
                                    color: Colors.white,
                                    width: size.width * 0.35,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      indexPass.name.toString(),
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
                                    width: size.width * 0.4,
                                    child: Text(
                                      indexPass.location.toString(),
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
                                    width: size.width * 0.4,
                                    child: Text(
                                      indexPass.contact.toString(),
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
                                          builder: (_) => PopUpOverLay(
                                              indexPass: indexPass),
                                        );
                                      },
                                      child: Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.033,
                                        decoration: const BoxDecoration(
                                            color: liteblue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: const Center(
                                          child: Text(
                                            'Description',
                                            style:
                                                TextStyle(color: Colors.white),
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
            itemtype == 'MyItem'
                ? Container(
                    padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: AlertDialog(
                              title: const Text('Please Confirm'),
                              content: const Text(
                                  'Are you sure you want to make this item mark as found.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: text(
                                      title: 'Cancel',
                                      color: Colors.red,
                                      fontsize: 14.0,
                                      fontweight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () {
                                    myItemsViewModel.myItemData(1);
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: text(
                                      title: 'Ok',
                                      color: Colors.green,
                                      fontsize: 14.0,
                                      fontweight: FontWeight.bold),
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
                : Container(),
          ],
        )));
  }
}
