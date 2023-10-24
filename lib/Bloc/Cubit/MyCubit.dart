import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';
import 'package:untitled19/DioHalder/DioHalder.dart';

import '../../Component/Constatnt/endPoint.dart';
import '../../Model/Catroies.dart';
import '../../Model/HomeModel.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(initialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int index = 0;

  void ChangeBootonNavBar(value) {
    index = value;
    emit(ChangeBotomNavBar());
  }

  HomeModel? homeModel;

  void ProdectBaner() {
    emit(lodingHomeScreen());
    dioHalder
        .getData(
      url: HOME,
      token: token,
    )
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners![0]);
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
}
