import 'package:flutter/material.dart';

import '../../Bloc/Cubit/MyCubit.dart';
import '../../Model/HomeModel.dart';

Widget prodectItems(ProductModel model, BuildContext context) => Container(
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
                            onPressed: () {
                              ShopCubit.get(context)
                                  .AddOrDeleteFavorite(model!.id);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  ShopCubit.get(context).favorites[model!.id]!
                                      ? Colors.red
                                      : Colors.black,
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
