import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:hital_shop/modules/profile/controller/address_controller.dart';
import 'package:hital_shop/modules/profile/pages/add_address_page.dart';
import 'package:iconsax/iconsax.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (AddressController controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const AppbarWidget(
                    title: 'آدرس ها',
                  ),
                  const SizedBox(height: 34.77),
                  controller.addressResponse == null
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 23.5),
                            child: ListView.builder(
                              itemCount:
                                  controller.addressResponse?.data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.37),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.45,
                                            left: 18.5,
                                            right: 18.5,
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                controller.addressResponse
                                                        ?.data?[index].title ??
                                                    '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    AddAddressPage(
                                                      addressModel: controller
                                                          .addressResponse
                                                          ?.data![index],
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 26,
                                                  height: 26,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .dividerColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Icon(
                                                    Iconsax.edit,
                                                    size: 17,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6.5),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.deleteAddress(
                                                    controller.addressResponse!
                                                        .data![index].id!,
                                                  );
                                                },
                                                child: Container(
                                                  width: 26,
                                                  height: 26,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .dividerColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Icon(
                                                    Iconsax.trash,
                                                    size: 17,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 21.5,
                                            right: 21.5,
                                            top: 6,
                                          ),
                                          child: Text(
                                            controller.addressResponse
                                                    ?.data?[index].address ??
                                                '',
                                            style: const TextStyle(
                                              color: Color(0xff8C8C8C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.5, bottom: 10),
                                          child: Visibility(
                                            visible: controller
                                                        .addressResponse
                                                        ?.data?[index]
                                                        .postalCode ==
                                                    null
                                                ? false
                                                : true,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                const Text(
                                                  'کد پستی :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  controller
                                                          .addressResponse
                                                          ?.data?[index]
                                                          .postalCode
                                                          .toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff8C8C8C),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                  if (controller.addressResponse != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ButtonWidget(
                        title: 'افزودن آدرس',
                        onPressed: () {
                          Get.to(const AddAddressPage());
                        },
                        hasBorder: true,
                      ),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        });
  }
}
