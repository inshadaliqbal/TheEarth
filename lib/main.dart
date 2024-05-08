import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'provider_engine.dart';
import 'myapp.dart';

void main(){
  runApp(TheEarth(),);
}

class TheEarth extends StatelessWidget {
  const TheEarth({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return MainEngine();
      },
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
