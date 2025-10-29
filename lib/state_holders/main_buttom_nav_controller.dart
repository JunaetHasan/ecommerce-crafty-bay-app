import 'package:get/get.dart';

class MainButtomNavController extends GetxController{

  int currentSelectIndex = 0;

  void changeScreen (int index){
    currentSelectIndex = index;
    update();
  }
  void backToHome(){
    changeScreen(0);
  }
}