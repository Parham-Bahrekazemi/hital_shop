import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/address_model.dart';
import 'package:hital_shop/backend/models/city_model.dart';
import 'package:hital_shop/backend/models/province_model.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/helpers/widgets/snackbar_widget.dart';
import 'package:hital_shop/helpers/widgets/textfield_widget.dart';
import 'package:hital_shop/modules/profile/controller/add_address_controller.dart';
import 'package:hital_shop/modules/profile/pages/map_page.dart';
import 'package:hital_shop/modules/profile/widgets/select_province_widget.dart';
import 'package:hital_shop/modules/profile/widgets/selected_city_widget.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key, this.addressModel});

  final AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
        init: AddAddressController(addressModel: addressModel),
        builder: (AddAddressController controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  AppbarWidget(
                    title: addressModel == null ? 'افزودن آدرس' : 'ویرایش آدرس',
                  ),
                  const SizedBox(height: 26.43),
                  controller.provinceResponse == null
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Form(
                              key: controller.globalKey,
                              child: Column(
                                children: <Widget>[
                                  TextFieldWidget(
                                    hintText: 'عنوان آدرس',
                                    controller: controller.textTitleController,
                                    validator: controller.titleValidator,
                                  ),
                                  const SizedBox(height: 12.5),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SelectProvinceWidget(
                                                    listProvince: controller
                                                        .provinceResponse!
                                                        .data!,
                                                    onSelected: (
                                                      ProvinceModel province,
                                                    ) =>
                                                        controller
                                                            .onSelectProvince(
                                                                province),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    controller.selectedProvince ==
                                                            null
                                                        ? 'استان ها'
                                                        : controller
                                                                .selectedProvince
                                                                ?.name ??
                                                            '',
                                                    style: TextStyle(
                                                      color: controller
                                                                  .selectedProvince ==
                                                              null
                                                          ? Theme.of(context)
                                                              .hintColor
                                                          : const Color(
                                                              0xff3A3A3A),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Icon(
                                                    CupertinoIcons.chevron_down,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 19.5),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (controller.selectedProvince !=
                                                  null) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                showModalBottomSheet(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return SelectCityWidget(
                                                      listCity: controller
                                                          .selectedProvince!
                                                          .cities!,
                                                      onSelected:
                                                          (CityModel city) {
                                                        controller
                                                            .onSelectCity(city);
                                                      },
                                                    );
                                                  },
                                                );
                                              } else {
                                                errorMessage(
                                                    'اول استان خود را انتخاب کنید');
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    controller.selectedCity ==
                                                            null
                                                        ? 'شهر'
                                                        : controller
                                                                .selectedCity
                                                                ?.name ??
                                                            '',
                                                    style: TextStyle(
                                                      color: controller
                                                                  .selectedCity ==
                                                              null
                                                          ? Theme.of(context)
                                                              .hintColor
                                                          : const Color(
                                                              0xff3A3A3A),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Icon(
                                                    CupertinoIcons.chevron_down,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12.5),
                                  TextFieldWidget(
                                    hintText: 'آدرس',
                                    controller:
                                        controller.textAddressController,
                                    validator: controller.addressValidator,
                                  ),
                                  const SizedBox(height: 12.5),
                                  TextFieldWidget(
                                    hintText: 'کد پستی',
                                    textInputType: TextInputType.number,
                                    controller:
                                        controller.textPostalCodeController,
                                  ),
                                  const SizedBox(height: 12.5),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        MapPage(
                                          onSelected: (String latlong) {
                                            controller
                                                .onSelectLocation(latlong);
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        controller.selectedLocation == null
                                            ? 'انتخاب موقعیت مکانی روی نقشه'
                                            : 'موقعیت مکانی انتخاب شد',
                                        style: TextStyle(
                                          color: controller.selectedLocation ==
                                                  null
                                              ? Theme.of(context).hintColor
                                              : const Color(0xff3A3A3A),
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18.5),
                                  ButtonWidget(
                                    title: addressModel == null
                                        ? 'افزودن آدرس'
                                        : 'ویرایش آدرس',
                                    onPressed: () {
                                      if (addressModel == null) {
                                        controller.addAdress();
                                      } else {
                                        controller.editAdress();
                                      }
                                    },
                                    loading: controller.loading,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
