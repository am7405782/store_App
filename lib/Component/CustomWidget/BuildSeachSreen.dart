import 'package:flutter/material.dart';

import '../../Bloc/Cubit/MyCubit.dart';
import '../../Model/SerachModel.dart';
import '../../Screen/Widget/BulipodectItems.dart';
import 'CustamWidget.dart';

Widget SeachScreenBuild(TextEditingController? controller, context) => Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextFromFaild(
            keyboardType: TextInputType.text,
            controller: controller,
            onTap: () {
              ShopCubit.get(context).SearchScreen(controller!.text);
              print(controller.text);
            },
            label: "Search",
            prefixIcon: Icons.search,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => BuildSerachIcon(
                  ShopCubit.get(context).searchModel!.data!.data![index],
                  context),
              itemCount: ShopCubit.get(context).searchModel!.data!.data!.length,
              separatorBuilder: (context, index) => Container(
                height: 5,
              ),
            ),
          ),
        ],
      ),
    );

Widget BuildSerachIcon(Product model, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BulipodectItems(),
            ));
      },
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                    "${model?.image}",
                  ),
                  height: 100,
                  width: 120,
                ),
                if (model?.discount != 0)
                  Container(
                    color: Colors.red.withOpacity(0.3),
                    child: Text(
                      "DISCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model?.name!.substring(0, 10)}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${model?.price}" r"$",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if (model?.discount != 0)
                          Text(
                            "${model?.oldPrice}",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: IconButton(
                              onPressed: () {
                                // ShopCubit.get(context).AddOrDeleteFavorite(model?.id);
                              },
                              icon: Icon(
                                Icons.favorite,
                                // color: ShopCubit.get(context).favorites[model?.id]!
                                //     ? Colors.red
                                //     : Colors.black,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
