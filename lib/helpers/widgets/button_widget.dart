import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.loading = false,
    this.hasBorder = false,
  });

  final String title;
  final void Function()? onPressed;

  final bool loading;

  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: loading ? () {} : onPressed,
      color: hasBorder ? Colors.transparent : Theme.of(context).primaryColor,
      minWidth: double.infinity,
      height: 54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color:
              hasBorder ? Theme.of(context).primaryColor : Colors.transparent,
        ),
      ),
      child: loading
          ? const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasBorder)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Icon(
                        Iconsax.add,
                        size: 26,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  Text(
                    title,
                    style: TextStyle(
                      color: hasBorder
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
