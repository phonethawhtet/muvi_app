import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvi/components/movie_detail_title_and_content.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muvi/constant.dart';

class MovieDetailScreen extends StatelessWidget {
  var iD;
  var title;
  var synopsis;
  var runTime;
  var director;
  var cast;
  var production;
  var type;
  var coverImageUrl;
  var imageUrls;
  var releaseDate;
  var uniqueID;
  MovieDetailScreen(
      {super.key,
      this.iD,
      this.title,
      this.synopsis,
      this.runTime,
      this.director,
      this.cast,
      this.production,
      this.type,
      this.coverImageUrl,
      this.imageUrls,
      this.releaseDate,
      this.uniqueID});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kBlueGray,
          child: SingleChildScrollView(
            child: Column(
              // Image
              children: [
                Stack(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.2],
                          ),
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(coverImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/arrow_left.svg',
                                      width: 48,
                                      height: 48,
                                    ),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/bookmark.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                  const SizedBox(width: 20),
                                  SvgPicture.asset(
                                    'assets/images/share.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ------------------------------ Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 34.68,
                      color: kWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        type,
                        style: const TextStyle(
                          fontSize: 18,
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 33),
                      Text(
                        '${releaseDate == "" ? DateTime.parse(releaseDate).year.toString() : DateTime.now().year}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 161,
                        height: 16,
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    synopsis ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                      color: kGray,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MovieDetailTitleAndContent(title: 'Cast', content: cast ?? ""),
                const SizedBox(height: 30),
                MovieDetailTitleAndContent(
                    title: 'Directed By', content: director ?? ""),
                const SizedBox(height: 30),
                MovieDetailTitleAndContent(
                    title: 'Produced By', content: production ?? ""),
                const SizedBox(height: 30),
                MovieDetailTitleAndContent(
                    title: 'Run Time', content: runTime + " mins"),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        // -------------------------------
        bottomNavigationBar: BottomAppBar(
          color: kDarkGray,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 342,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kRed,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg:
                          "Your ticket has been booked. Enjoy your movie soon.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: kRed,
                      textColor: kWhite,
                      fontSize: 16.0,
                    );
                  },
                  child: const Text(
                    'Buy Tickets',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
