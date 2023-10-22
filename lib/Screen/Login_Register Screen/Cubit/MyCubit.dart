import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/DioHalder/DioHalder.dart';
import 'package:untitled19/Screen/Login_Register%20Screen/Cubit/MyStates.dart';

import '../../../Component/Constatnt/endPoint.dart';
import '../Model/LoginModel.dart';

class ShopingLoginCubit extends Cubit<MyStates> {
  ShopingLoginCubit() : super(inaialState());

  static ShopingLoginCubit get(context) => BlocProvider.of(context);

  IconData icon = Icons.visibility_outlined;
  bool ispassword = true;

  void changePassword() {
    ispassword = !ispassword;
    icon = ispassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(changeVisiaState());
  }

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String pass,
  }) {
    emit(lodingLoginScreen());
    dioHalder.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': pass,
      },
    ).then((value) {
      loginModel = LoginModel.fromjeson(value.data);
      print(loginModel?.data?.id);
      emit(scafullLoginScreen(loginModel!));
    }).catchError((eror) {
      print(eror.toString());
      emit(erorLoginScreen());
    });
  }

  void userRegister({
    required String email,
    required String phone,
    required String name,
    required String password,
  }) {
    emit(lodingRegisterScreen());
    dioHalder.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
      },
    ).then((value) {
      loginModel = LoginModel.fromjeson(value.data);
      print(loginModel?.data?.email);
      emit(scafullRegisterScreen(loginModel!));
    }).catchError((eror) {
      print(eror.toString());
      emit(erorRegisterScreen());
    });
  }
}
