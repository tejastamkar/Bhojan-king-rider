import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:riderapp/data/reviewdata.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rate = 4.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ratings"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      "Your Rating",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.green.shade500,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "$rate",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "Rating & Reviews (${reviewData.length})",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    // const Spacer(),
                    // Container(
                    //   padding: const EdgeInsets.all(7),
                    //   decoration: BoxDecoration(
                    //       color: Colors.green.shade500,
                    //       borderRadius: BorderRadius.circular(4)),
                    //   child: Row(
                    //     children: [
                    //       const Icon(
                    //         Icons.star_outlined,
                    //         color: Colors.white,
                    //       ),
                    //       const SizedBox(
                    //         width: 7,
                    //       ),
                    //       Text(
                    //         "$rate",
                    //         style: const TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w400,
                    //             color: Colors.white),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: reviewData.length,
                  itemBuilder: ((context, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      reviewData[index]["img"],
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(reviewData[index]["name"]),
                                      RatingBar.builder(
                                        initialRating: reviewData[index]
                                            ["rating"],
                                        minRating: 1,
                                        ignoreGestures: true,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        glow: false,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color:
                                              Color.fromRGBO(242, 246, 40, 1),
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(reviewData[index]["date"])
                                ],
                              ),
                              if (reviewData[index]["reviewText"] != "")
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: SizedBox(
                                        width: width - 100,
                                        child: Text(
                                            reviewData[index]["reviewText"])),
                                  ),
                                )
                              else
                                const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ))),
            ],
          )),
    );
  }
}
