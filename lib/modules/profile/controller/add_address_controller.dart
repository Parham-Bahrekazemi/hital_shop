import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/address_model.dart';
import 'package:hital_shop/backend/models/city_model.dart';
import 'package:hital_shop/backend/models/province_model.dart';

import 'package:hital_shop/backend/repository/profile_repository.dart';
import 'package:hital_shop/backend/response/province_response.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/modules/product/controller/order_controller.dart';
import 'package:hital_shop/modules/profile/controller/address_controller.dart';

class AddAddressController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  ProfileRespository respository = ProfileRespository();

  ProvinceResponse? provinceResponse;

  ProvinceModel? selectedProvince;

  CityModel? selectedCity;

  String? selectedLocation;

  late TextEditingController textTitleController =
      TextEditingController(text: addressModel?.title ?? '');
  late TextEditingController textAddressController =
      TextEditingController(text: addressModel?.address ?? '');
  late TextEditingController textPostalCodeController = TextEditingController(
      text: addressModel?.postalCode == null
          ? ''
          : addressModel?.postalCode.toString());

  final AddressModel? addressModel;

  bool loading = false;

  AddAddressController({this.addressModel});

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا عنوان آدرس را وارد کنید';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا آدرس را وارد کنید';
    }
    return null;
  }

  void onSelectProvince(ProvinceModel value) {
    selectedProvince = value;
    selectedCity = null;
    update();
  }

  void onSelectCity(CityModel value) {
    selectedCity = value;
    update();
  }

  void onSelectLocation(String value) {
    selectedLocation = value;
    update();
  }

  void getProvince() async {
    provinceResponse = await respository.getProvince();

    if (addressModel != null) {
      selectedProvince = provinceResponse?.data!
          .firstWhere((element) => element.id == addressModel!.provinceId);

      selectedCity = selectedProvince!.cities!
          .firstWhere((element) => element.id == addressModel!.cityId);
    }

    update();
  }

  Future<void> addAdress() async {
    if (globalKey.currentState!.validate()) {
      if (selectedCity != null) {
        loading = true;
        update();
        bool response = await respository.addAddress(
          title: textTitleController.text,
          cityId: selectedCity!.id!,
          address: textAddressController.text,
          postalCode: textPostalCodeController.text,
          latlong: selectedLocation,
        );

        if (response) {
          loading = false;
          update();
          Get.back();
          if (Get.isRegistered<AddressController>()) {
            Get.find<AddressController>().getAddress();
          }
          if (Get.isRegistered<OrderController>()) {
            Get.find<OrderController>().getAddress();
          }

          successMessage('آدرس اضافه شد');
        } else {
          loading = false;
          update();
          errorMessage('آدرس اضافه نشد');
        }
      } else {
        errorMessage('لطفا شهر خود را نتخاب کنید');
      }
    }
  }

  Future<void> editAdress() async {
    if (globalKey.currentState!.validate()) {
      if (selectedCity != null) {
        loading = true;
        update();
        bool response = await respository.editAddress(
          id: addressModel!.id!,
          title: textTitleController.text,
          cityId: selectedCity!.id!,
          address: textAddressController.text,
          postalCode: textPostalCodeController.text,
          latlong: selectedLocation,
        );

        if (response) {
          loading = false;
          update();
          Get.back();
          Get.find<AddressController>().getAddress();
          successMessage('آدرس ویرایش شد');
        } else {
          loading = false;
          update();
          errorMessage('آدرس ویرایش نشد');
        }
      }
    }
  }

  @override
  void onInit() {
    selectedLocation = addressModel?.latlong;

    getProvince();
    super.onInit();
  }
}
