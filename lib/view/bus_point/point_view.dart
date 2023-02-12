import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../widgets/text.dart';
import 'bus_point_data.dart';

class PointView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final indexPass;
  const PointView({Key? key, required this.indexPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var image = indexPass['images'];

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: InkWell(
                onTap: () {
                  print('datat ${indexPass.id}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BusPointData(indexPass: indexPass.id)),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                                "https://png.pngtree.com/png-vector/20190912/ourlarge/pngtree-clock-icon-in-flat-style-png-image_1728101.jpg",
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        text(
                            title: indexPass.name.toString(),
                            color: black,
                            fontsize: 13.0,
                            fontweight: FontWeight.bold),
                      ]),
                ))));
  }
}
