import 'package:flutter/material.dart';

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    Key? key,
    this.menu,
    this.icon,
    this.onPressed,
    this.showBottomLine = true,
    this.isBoldText = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.showSwitch = false,
    this.isSwitchOn = false,
    this.onChanged,
  }) : super(key: key);

  final String? menu;
  final Widget? icon;
  final GestureTapCallback? onPressed;
  final bool showBottomLine;
  final bool isBoldText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool showSwitch;
  final bool isSwitchOn;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Container(
            height: 55,
            color: Colors.transparent,
            padding: padding,
            margin: margin,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: icon!,
                  ),
                if (icon != null) const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    menu ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF363636),
                      fontWeight: isBoldText ? FontWeight.w700 : FontWeight.w400,
                      height: 1.1,
                    ),
                  ),
                ),
                if (showSwitch)
                  GestureDetector(
                    onTap: () {
                      onChanged!(!isSwitchOn);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        isSwitchOn ? "assets/images/icons_switch_on.png" : "assets/images/icons_switch_off.png",
                        height: 24,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (showBottomLine)
          Container(
            height: 1,
            color: const Color(0xFFEEEEEE),
            margin: margin,
          ),
      ],
    );
  }
}
