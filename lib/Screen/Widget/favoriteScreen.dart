import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Bloc/Cubit/MyCubit.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';

import '../../Component/CustomWidget/buildFavoeiteSceen.dart';

class favoriteScreen extends StatelessWidget {
  const favoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..GetFavoriteScreen()
        ..ProdectBaner(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ConditionalBuilder(
              condition: state is scafullHomeScreen,
              builder: (context) => GridView.builder(
                itemCount:
                    ShopCubit.get(context).favoriteModel?.data?.data?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.59,
                    crossAxisSpacing: 6),
                itemBuilder: (context, index) => buildFavoeiteSceen(
                  ShopCubit.get(context)
                      .favoriteModel!
                      .data!
                      .data![index]
                      .product,
                  context,
                  isOldPrice: true,
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
