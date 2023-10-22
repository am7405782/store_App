import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Screen/Login_Register%20Screen/Cubit/MyCubit.dart';
import 'package:untitled19/Screen/Login_Register%20Screen/Cubit/MyStates.dart';
import 'package:untitled19/SharedPre/SharedPrefrance.dart';

import '../../Component/CustomWidget/CustamWidget.dart';
import '../Home/StoreLayout.dart';

class RegisterScreen extends StatelessWidget {
  var foemKey = GlobalKey<FormState>();
  var personControler = TextEditingController();

  var emailControler = TextEditingController();
  var passControler = TextEditingController();
  var phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopingLoginCubit(),
      child: BlocConsumer<ShopingLoginCubit, MyStates>(
        listener: (context, state) {
          if (state is scafullRegisterScreen) {
            if (state.model.status ?? true) {
              print(state.model.data?.token);
              CacheHealper.SavedData(
                      key: "token", value: state.model.data?.token)
                  .then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreLayout(),
                    ),
                    (route) => false);
              });
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: foemKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "HappyMonkey",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Register Now to browse our hot offers",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "HappyMonkey",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFromFaild(
                        prefixIcon: Icons.person,
                        label: "UserName",
                        onTap: () {},
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Pleas enter UserName';
                          }
                          return null;
                        },
                        controller: personControler,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFromFaild(
                        prefixIcon: Icons.email,
                        label: "Email Apress",
                        onTap: () {},
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Pleas enter email';
                          }
                          return null;
                        },
                        controller: emailControler,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFromFaild(
                        suffixIcon: ShopingLoginCubit.get(context).icon,
                        prefixIcon: Icons.lock,
                        label: "password",
                        onTap: () {
                          ShopingLoginCubit.get(context).changePassword();
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Pleas enter email';
                          }
                          return null;
                        },
                        controller: passControler,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ShopingLoginCubit.get(context).ispassword,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFromFaild(
                        prefixIcon: Icons.phone,
                        label: "phone",
                        onTap: () {},
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Pleas enter email';
                          }
                          return null;
                        },
                        controller: phoneControler,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! lodingRegisterScreen,
                        builder: (context) => InkWell(
                          onTap: () {
                            if (foemKey.currentState!.validate()) {
                              ShopingLoginCubit.get(context).userRegister(
                                  email: emailControler.text,
                                  phone: phoneControler.text,
                                  name: personControler.text,
                                  password: passControler.text);
                            }
                            ;
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "HappyMonkey",
                                ),
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
