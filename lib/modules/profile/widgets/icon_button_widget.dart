import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:iconsax/iconsax.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.title,
    this.icon,
    this.svgIcon,
    this.onTap,
  });

  final String title;

  final IconData? icon;

  final String? svgIcon;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff14489E).withOpacity(0.15),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.5),
          child: Row(
            children: <Widget>[
              svgIcon != null
                  ? SvgPicture.asset(svgIcon!)
                  : Icon(
                      icon,
                      color: Theme.of(context).primaryColor,
                    ),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Icon(
                Iconsax.arrow_left,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
