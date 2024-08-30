import 'package:get/get.dart';

import '../../interface/usecase/user.dart';

class AppBinding extends Bindings{

  @override
  void dependencies() {
    dependencyBloc();
    dependencyUseCase();
    dependencyRepository();
    dependencyService();
    dependencyMapper();
  }

  void dependencyBloc(){

  }

  void dependencyUseCase(){
    Get.lazyPut<IUserUseCase>((use) => );
  }

  void dependencyRepository(){

  }

  void dependencyService(){

  }

  void dependencyMapper(){

  }

}