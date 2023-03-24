import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvi/constant.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: BottomNavigationBar(
        backgroundColor: kBlueGrayLight,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                width: 32,
                height: 32,
              ),
              onPressed: () {},
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset(
                'assets/images/ticket.svg',
                width: 32,
                height: 32,
              ),
              onPressed: () {},
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Center(
                child: SvgPicture.asset(
                  'assets/images/profile.svg',
                  width: 32,
                  height: 32,
                ),
              ),
              onPressed: () {},
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
