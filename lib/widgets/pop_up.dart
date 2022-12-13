import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUpOverLay extends StatefulWidget {
  var indexPass;

  PopUpOverLay({super.key, required this.indexPass});

  @override
  State<StatefulWidget> createState() => PopUpOverLayState();
}

class PopUpOverLayState extends State<PopUpOverLay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 380.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 260.0),
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    //  color: Colors.red,
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.network(
                        //"https://aremo8+rch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png",
                        "https://qiu.globalasias.com/icon/${widget.indexPass.image}",
                        //  url+image[0]['image_name'],
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 150,
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Center(
                    child: Text(
                      'Item Description',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.28,
                    child: Center(
                      child: Text(
                        widget.indexPass.detail.toString(),
                        style: const TextStyle(
                            overflow: TextOverflow.clip,
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
