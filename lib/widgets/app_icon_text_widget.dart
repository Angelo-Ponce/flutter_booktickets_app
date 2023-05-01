import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:gap/gap.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const AppIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getWidth(12), horizontal: AppLayout.getHeight(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
        color: Colors.white
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFBFC2DF)),
          Gap(AppLayout.getWidth(10)),
          Text(text, style: Styles.textStyle,)
        ],
      ),
    );
  }
}