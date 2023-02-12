import 'package:flutter/material.dart';
import 'package:qauuni/res/app_urls.dart';

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
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(15.0),
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
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      //  color: Colors.red,
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/placeholder.png'),
                              image: NetworkImage(
                                "${AppUrl.baseUrlImage}icon/${widget.indexPass.image}",
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
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.indexPass.detail.toString(),
                        // 'this is test descriptuon i would  asdsaasdaasd as asd lkj hkhd s dsdlike to says you that why my life is fucked up and i dont have anything to talk aboutt there are lost of thisnadh that i can tell you but i lost my most precious thing i would love it i can not expalin to you that how much important is thats is much that shat is it and each and every thing is related to it but i wannt to tell you that do not phk me because your life is fuckup from every side hdsfj sdjfh sdjfh sudhf dshhgsd fjhsf idhf hsdfh hsdfh ',
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal),
                        maxLines: 40,
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
