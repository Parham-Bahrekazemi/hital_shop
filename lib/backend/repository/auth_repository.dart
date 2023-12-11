import 'package:hital_shop/backend/repository/base_repository.dart';
import 'package:hital_shop/backend/response/register_response.dart';

import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';

class AuthRepository extends BaseRepsitory {
  Future<RegisterResponse?> register({
    required String name,
    required String mobile,
    required String password,
    required String passwordConfirmation,
  }) async {
    var response = await dio.post(
      '/register',
      data: {
        'name': name,
        'mobile': mobile,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    if (response.statusCode == 200) {
      successMessage('ثبت نام با موفقیت انجام شد');
      return RegisterResponse.fromJson(response.data);
    } else {
      errorMessage('${response.data['message']}');
      return null;
    }
  }

  Future<RegisterResponse?> login({
    required String mobile,
    required String password,
  }) async {
    var response = await dio.post(
      '/login',
      data: {
        'mobile': mobile,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      successMessage('ورود با موفقیت انجام شد');
      return RegisterResponse.fromJson(response.data);
    } else {
      errorMessage('${response.data['message']}');
      return null;
    }
  }
}
