import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled19/DioHalder/DioHalder.dart';

import 'Bloc/Onprovider/BlocObserver.dart';
import 'Screen/Home/StoreLayout.dart';
import 'SharedPre/SharedPrefrance.dart';
import 'SharedPre/Theam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await dioHalder.init();
  await CacheHealper.init();
  Widget widget;
  // bool? onBoarding=CacheHealper.getData(key: "onBorading");
  // String token=CacheHealper.getData(key: "token");
  // if(onBoarding!=null){
  //    widget =LoginScreen();
  //
  // }else{
  //   widget=OnbordingScrren();
  //
  // }

  runApp(StoreApp(
      // widget,
      ));
}

class StoreApp extends StatelessWidget {
  // final Widget widget;
  // StoreApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StoreApp",
      home: StoreLayout(),
      debugShowCheckedModeBanner: false,
      theme: lightTheam,
    );
  }
}
