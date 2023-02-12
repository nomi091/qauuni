import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qauuni/routes/route.dart';
import 'package:qauuni/view_model/Items/upload_item_view_model.dart';
import 'package:qauuni/view_model/auth/auth_view_model.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UploadItemViewModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // darkTheme: ThemeData.dark(),
          initialRoute: Routes.splash,
          onGenerateRoute: Routes.generateRoute,
          //  getPages: Routes,
          //00509a
        ));
  }
}
