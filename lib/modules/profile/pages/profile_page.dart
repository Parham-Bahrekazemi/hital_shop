import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/extentions/string_extention.dart';
import 'package:hital_shop/modules/profile/controller/profile_controller.dart';
import 'package:hital_shop/modules/profile/pages/address_page.dart';
import 'package:hital_shop/modules/profile/pages/edit_profile_page.dart';
import 'package:hital_shop/modules/profile/pages/orders_page.dart';
import 'package:hital_shop/modules/profile/widgets/icon_button_widget.dart';
import 'package:hital_shop/modules/profile/widgets/logout_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return controller.userModel == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff14489E).withOpacity(0.15),
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 89,
                            height: 89,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE8F1FF),
                            ),
                            child: const Center(
                              child: Icon(
                                Iconsax.user,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            controller.userModel?.name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            controller.userModel?.mobile?.farsiConvert ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () => Get.to(EditProfilePage(
                              userModel: controller.userModel!,
                            )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Iconsax.edit,
                                  size: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  'ویرایش'.farsiConvert,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButtonWidget(
                      title: 'آدرس ها',
                      icon: Iconsax.map,
                      onTap: () {
                        Get.to(const AddressPage());
                      },
                    ),
                    const SizedBox(height: 15),
                    IconButtonWidget(
                      title: 'سفارشات',
                      svgIcon: 'assets/images/orders.svg',
                      onTap: () {
                        Get.to(const Orderspage());
                      },
                    ),
                    const SizedBox(height: 15),
                    IconButtonWidget(
                      title: 'دعوت از دوستان',
                      icon: Iconsax.user_cirlce_add,
                      onTap: () {
                        Share.share(
                            'لطفا اپلیکیشن هیتال را نصب کنید : https://google.com');
                      },
                    ),
                    const SizedBox(height: 15),
                    IconButtonWidget(
                      title: 'خروج از حساب',
                      icon: Iconsax.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LogoutDioalog();
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
