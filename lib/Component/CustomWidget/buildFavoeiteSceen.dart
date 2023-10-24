import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/Cubit/MyCubit.dart';
import '../../Model/favoritesModel.dart';

Widget buildFavoeiteSceen(Product? model, context, {bool isOldPrice = true}) =>
    Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                image: NetworkImage(
                  "${model?.image}",
                ),
                width: 250,
                height: 180,
              ),
              if (model?.discount != 0)
                Positioned(
                  left: 10,
                  top: 10,
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
          SizedBox(
            height: 10,
          ),
          Text(
            "${model?.name}",
            style: GoogleFonts.aboreto(
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  r"$" "${model?.oldPrice}",
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.black, fontSize: 18),
                ),
                Spacer(),
                if (model?.discount != 0)
                  Text(
                    r"$" "${model?.price}",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: IconButton(
                      onPressed: () {
                        ShopCubit.get(context).AddOrDeleteFavorite(model?.id);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: ShopCubit.get(context).favorites[model?.id]!
                            ? Colors.red
                            : Colors.black,
                        size: 30,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
