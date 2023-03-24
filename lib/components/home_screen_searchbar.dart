import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muvi/constant.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 23),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kDarkGray,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) {
            Fluttertoast.showToast(
              msg: value,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: kRed,
              textColor: kWhite,
              fontSize: 16.0,
            );
          },
          style: const TextStyle(
            fontFamily: 'Product Sans',
            fontSize: 16,
            color: kLightGray,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 12, top: 13, bottom: 13),
              child: SvgPicture.asset(
                'assets/images/search.svg',
                color: kLightGray,
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 24, minHeight: 24),
            hintText: 'Search',
            hintStyle: const TextStyle(
              fontFamily: 'Product Sans',
              fontSize: 16,
              color: kLightGray,
            ),
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
