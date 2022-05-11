import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Utils/export.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
    create: (context)=>GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      initialRoute: "/home",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}

