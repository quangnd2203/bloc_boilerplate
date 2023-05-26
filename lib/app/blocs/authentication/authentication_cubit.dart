import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_pref.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.loading);

  late dynamic userModel;

  void checkUser(){}

  void saveUser(){}

  void clearUser(){}
}
