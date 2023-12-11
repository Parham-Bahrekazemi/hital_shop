import 'package:get/get.dart';
import 'package:hital_shop/backend/models/user_model.dart';
import 'package:hital_shop/backend/repository/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileRespository respository = ProfileRespository();

  UserModel? userModel;

  void getProfile() async {
    userModel = null;
    update();
    userModel = await respository.getProfile();
    update();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
