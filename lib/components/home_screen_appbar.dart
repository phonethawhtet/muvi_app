import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 8, right: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: 90.49,
            height: 24.78,
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/noti.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            'assets/images/setting.svg',
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
