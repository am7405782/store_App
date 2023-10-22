import '../Model/LoginModel.dart';

abstract class MyStates {}

class inaialState extends MyStates {}

class changeVisiaState extends MyStates {}

class scafullLoginScreen extends MyStates {
  final LoginModel model;

  scafullLoginScreen(this.model);
}

class lodingLoginScreen extends MyStates {}

class erorLoginScreen extends MyStates {}

class scafullRegisterScreen extends MyStates {
  final LoginModel model;

  scafullRegisterScreen(this.model);
}

class lodingRegisterScreen extends MyStates {}

class erorRegisterScreen extends MyStates {}
