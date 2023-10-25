import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Bloc/Cubit/MyCubit.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';

import '../../Component/CustomWidget/BuildSeachSreen.dart';

class searchScreen extends StatelessWidget {
  var TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..SearchScreen(TextController.text),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          if (state is lodingSearchScreen) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).searchModel != null,
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: SeachScreenBuild(TextController, context),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
