import 'package:flutter/material.dart';
import 'package:muvi/constant.dart';

class MovieDetailTitleAndContent extends StatelessWidget {
  final String title;
  final String content;
  const MovieDetailTitleAndContent({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kWhite,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  content,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                    color: kGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
