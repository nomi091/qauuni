import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qauuni/res/app_urls.dart';
import 'package:qauuni/view_model/Items/my_item_view_model.dart';

import '../../utils/color.dart';
import '../../widgets/pop_up.dart';

class LostView extends StatelessWidget {
  final indexPass;

  LostView({
    Key? key,
    required this.indexPass,
  }) : super(key: key);
  MyItemsViewModel myItemsViewModel = MyItemsViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
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
                              padding: const EdgeInsets.only(left: 20),
                              // color: Colors.red,
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/placeholder.png'),
                                      image: NetworkImage(
                                        "${AppUrl.baseUrlImage}icon/${indexPass.image}",
                                      ),
                                      fit: BoxFit.cover,
                                      imageErrorBuilder:
                                          (context, object, trace) {
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
                                              style: TextStyle(
                                                  color: Colors.white),
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
            ],
          )),
   
    );
  }
}
