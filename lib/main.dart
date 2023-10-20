// import 'package:flutter/material.dart';
// import 'package:instragram_clone/view/splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const SpalshScreen());
//   }
// }

import 'package:flutter/material.dart';

import 'package:instragram_clone/provider/auth_provider.dart';
import 'package:instragram_clone/provider/image_delete.dart';
import 'package:instragram_clone/provider/password_provider.dart';
import 'package:instragram_clone/utils/routes/routes.dart';
import 'package:instragram_clone/view/splash_screen.dart';
import 'package:instragram_clone/view_model/widget/auth_view_model.dart';
import 'package:provider/provider.dart';

late Size mq;
void main() {
  //late Size mq;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => CountProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => ExampleTwoProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => completeprofileprovider(),
        // ),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => ImageProviderModel()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordVisibilityNotifier(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: SpalshScreen(),
          //initialRoute:  TutorialScreen1() ,
          onGenerateRoute: Routes.MaterialPageRoutegenerateRoute),
    );
    // return MaterialApp(
    //   home: CountExample(),
    // );
  }
}
