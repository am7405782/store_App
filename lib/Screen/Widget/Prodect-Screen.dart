import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/Cubit/MyCubit.dart';
import '../../Bloc/Cubit/ShopStates.dart';
import '../../Component/CustomWidget/prodectItems.dart';
import '../../Model/Catroies.dart';
import '../../Model/HomeModel.dart';
import 'Widget.dart';

class prodectScreen extends StatelessWidget {
  const prodectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..ProdectBaner()
        ..GetCatroisData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null,
            builder: (context) => ProdectItemsScreen(
                ShopCubit.get(context).homeModel!,
                ShopCubit.get(context).categoriesModel!,
                context),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

Widget ProdectItemsScreen(HomeModel model, CategoriesModel catrois, context) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model.data?.banners!
                .map(
                  (e) => Image(
                    image: NetworkImage("${e.image}"),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categoris",
                  style: GoogleFonts.aboreto(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 168,
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        CatroisBuilder(catrois.data!.data![index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "'New Products'",
                  style: GoogleFonts.aboreto(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Container(
                  child: GridView.count(
                    mainAxisSpacing: 150,
                    crossAxisSpacing: 2,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1 / 0.7,
                    children: List.generate(
                        model.data!.products.length,
                        (index) =>
                            prodectItems(model.data!.products[index], context)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

