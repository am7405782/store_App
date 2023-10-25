import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';
import 'package:untitled19/DioHalder/DioHalder.dart';

import '../../Component/Constatnt/endPoint.dart';
import '../../Model/Catroies.dart';
import '../../Model/HomeModel.dart';
import '../../Model/SerachModel.dart';
import '../../Model/favoritesModel.dart';
import '../../Screen/Widget/favoriteScreen.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(initialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int index = 0;

  void ChangeBootonNavBar(value) {
    index = value;
    emit(ChangeBotomNavBar());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};

  void ProdectBaner() {
    emit(lodingHomeScreen());
    dioHalder
        .getData(
      url: HOME,
      token: token,
    )
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data?.banners[0].image);
      homeModel?.data?.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());

      emit(scafullHomeScreen());
    }).catchError((e) {
      print(e.toString());
      emit(erorHomeScreen());
    });
  }

  CategoriesModel? categoriesModel;

  void GetCatroisData() {
    emit(LodingCategoriesScreen());
    dioHalder
        .getData(
      url: CATEGORIES,
      token: token,
    )
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data!.data?[0].name);
      emit(scafullCategoriesScreen());
    }).catchError((e) {
      print(e.toString());
      emit(erorCategoriesScreen());
    });
  }

  FavoritesModel? favoriteModel;

  void GetFavoriteScreen() {
    emit(LodingfavoritesScreen());
    dioHalder
        .getData(
      url: Favorites,
      token: token,
    )
        .then((value) {
      favoriteModel = FavoritesModel.fromJson(value.data);
      print(favoriteModel!.data!.data![0].product);
      emit(scafullfavoritesScreen());
    }).catchError((e) {
      print(e.toString());
      emit(erorfavoritesScreen());
    });
  }

  void AddOrDeleteFavorite(int? Prodectid) {
    dioHalder.postData(
      data: {
        'product_id': Prodectid,
      },
      url: Favorites,
      token: token,
    ).then((value) {
      print(value.data);
      emit(ShopChangeFavoritesState());
    }).catchError((e) {
      print(e.toString());
      emit(ShopChangeFavoriteserrorState());
    });
    if (favorites.containsKey(Prodectid)) {
      final currentStatus = favorites[Prodectid];
      favorites[Prodectid] = !(currentStatus ?? false);
      favoriteScreen();
      emit(FavoritesUpdatedState());
    }
  }

  SearchModel? searchModel;

  void SearchScreen(String text) {
    emit(lodingSearchScreen());
    dioHalder
        .postData(
            url: PRDECTSEARCH,
            data: {
              "text": text,
            },
            token: token)
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(text);
      emit(scafullSearchScreen());
    }).catchError((e) {
      print(e.toString());
      emit(erorSearchScreen());
    });
  }
}
