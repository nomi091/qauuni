import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/routes/route.dart';
import 'package:qauuni/view_model/auth_view_model.dart';




Future<void> main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (_)=>AuthViewModel())
    ],
       child:  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // darkTheme: ThemeData.dark(),
        initialRoute: Routes.splash,
        getPages: Routes.list,
        //00509a
      )
    );
    

  }
}
