import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/Cubit/MyCubit.dart';
import '../../Bloc/Cubit/ShopStates.dart';
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
                ShopCubit.get(context).categoriesModel!),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

Widget ProdectItemsScreen(HomeModel model, CategoriesModel catrois) =>
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
                    children: List.generate(model.data!.products.length,
                        (index) => prodectItems(model.data!.products[index])),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget prodectItems(ProductModel model) => Container(
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 8,
                  left: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.name}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "${model.price}" r"$",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            )),
                      ],
                    ),
                    Text(
                      "${model.oldPrice}" r"$",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -120,
            right: 0,
            child: Image(
              image: NetworkImage(
                "${model.image}",
              ),
              height: 100,
              width: 150,
            ),
          ),
          if (model.discount != 0)
            Positioned(
              left: 10,
              child: Container(
                color: Colors.red,
                child: Text(
                  "DisCount",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
