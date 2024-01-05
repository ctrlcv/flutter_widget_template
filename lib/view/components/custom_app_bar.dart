import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.titleWidget,
    this.title = "",
    this.titleFontSize = 18,
    this.showBackButton = true,
    this.backOnPressed,
    this.showCloseButton = true,
    this.closeOnPressed,
    this.showBoxShadow = true,
    this.showProgress = false,
    this.progress = 0.0,
  }) : super(key: key);

  final Widget? titleWidget;
  final String? title;
  final double titleFontSize;
  final bool showBackButton;
  final Function? backOnPressed;
  final bool showCloseButton;
  final Function? closeOnPressed;
  final bool showBoxShadow;
  final bool showProgress;
  final double progress;

  @override
  PreferredSizeWidget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double progressWidth = screenWidth * progress;

    return AppBar(
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(CupertinoIcons.back, size: 28, color: Colors.black),
              // Image.asset(
              //   'assets/images/appbar_icon_back.png',
              //   height: 28,
              //   width: 28,
              //   fit: BoxFit.fitWidth,
              // ),
              onPressed: () {
                if (backOnPressed != null) {
                  backOnPressed!();
                } else {
                  Get.back();
                }
              },
            )
          : Container(),
      title: Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: 48,
        child: (titleWidget != null)
            ? titleWidget
            : Text(
                title!,
                style: TextStyle(
                  fontSize: titleFontSize,
                  color: const Color(0xFF363636),
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
      actions: [
        showCloseButton
            ? IconButton(
                icon: const Icon(CupertinoIcons.clear_thick, size: 28, color: Colors.black),
                // Image.asset(
                //   'assets/images/appbar_icon_close.png',
                //   height: 28,
                //   width: 28,
                //   fit: BoxFit.fitWidth,
                // ),
                onPressed: () {
                  if (closeOnPressed != null) {
                    closeOnPressed!();
                  }
                },
              )
            : IconButton(
                icon: Container(width: 24),
                onPressed: null,
              ),
        const SizedBox(width: 8),
      ],
      bottom: showBoxShadow
          ? PreferredSize(
              preferredSize: const Size.fromHeight(2.5),
              child: showProgress
                  ? Container(
                      height: 2.5,
                      color: const Color(0xFFF5F6F8),
                      child: Row(
                        children: [
                          Container(
                            width: progressWidth,
                            height: 2.5,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4C7FF6),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(3.0),
                                bottomRight: Radius.circular(3.0),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    )
                  : Container(
                      height: 2.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFC3C3C3).withOpacity(0.75),
                            offset: const Offset(0.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                    ),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(2.5),
              child: Container(),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.5);
}
