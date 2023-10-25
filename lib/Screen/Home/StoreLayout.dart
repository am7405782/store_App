import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled19/Bloc/Cubit/MyCubit.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';

import '../Widget/Prodect-Screen.dart';
import '../Widget/catgroisScreen.dart';
import '../Widget/favoriteScreen.dart';
import '../Widget/searchScreen.dart';
import '../Widget/seetingScrren.dart';

class StoreLayout extends StatelessWidget {
  List<Widget> Screen = [
    prodectScreen(),
    CatroisScreen(),
    favoriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                "SHOP",
                style: GoogleFonts.aboreto(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(50)),
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => searchScreen(),
                          ));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            body: Screen[ShopCubit.get(context).index],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                ShopCubit.get(context).ChangeBootonNavBar(value);
              },
              currentIndex: ShopCubit.get(context).index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
