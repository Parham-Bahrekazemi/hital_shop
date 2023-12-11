import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hital_shop/backend/models/province_model.dart';

class SelectProvinceWidget extends StatelessWidget {
  const SelectProvinceWidget({
    super.key,
    required this.listProvince,
    required this.onSelected,
  });

  final List<ProvinceModel> listProvince;

  final Function(ProvinceModel province) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        height: 400,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: listProvince.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onSelected(listProvince[index]);
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      listProvince[index].name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
