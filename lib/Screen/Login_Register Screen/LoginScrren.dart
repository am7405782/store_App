import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Screen/Login_Register%20Screen/Cubit/MyStates.dart';

import '../../Component/CustomWidget/CustamWidget.dart';
import '../../SharedPre/SharedPrefrance.dart';
import '../Home/StoreLayout.dart';
import 'Cubit/MyCubit.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  var foemKey = GlobalKey<FormState>();
  var emailControler = TextEditingController();
  var passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopingLoginCubit(),
      child: BlocConsumer<ShopingLoginCubit, MyStates>(
        listener: (context, state) {
          if (state is scafullLoginScreen) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "HappyMonkey",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login Now to browse our hot offers",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "HappyMonkey",
                      ),
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
                    ConditionalBuilder(
                      condition: state is! lodingLoginScreen,
                      builder: (context) => InkWell(
                        onTap: () {
                          if (foemKey.currentState!.validate()) {
                            ShopingLoginCubit.get(context).userLogin(
                                email: emailControler.text,
                                pass: passControler.text);
                          }
                          ;
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "login",
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Dont haveaccount??",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "HappyMonkey",
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          child: Text(
                            "REGISER",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontFamily: "HappyMonkey",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
