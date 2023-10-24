import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Bloc/Cubit/MyCubit.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';

import '../../Component/CustomWidget/CatroiesScreenBuild.dart';

class CatroisScreen extends StatelessWidget {
  const CatroisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..GetCatroisData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).categoriesModel != null,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => CatroiesScreenBuild(context,
                  ShopCubit.get(context).categoriesModel!.data!.data![index]),
              separatorBuilder: (context, index) => Container(),
              itemCount:
                  ShopCubit.get(context).categoriesModel!.data!.data!.length,
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
