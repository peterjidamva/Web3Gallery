import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:animate_do/animate_do.dart';
import "package:iconsax/iconsax.dart";

// azka dev
// gibran alazka

class BidPage extends StatefulWidget {
  String image;
  String category;
  String name;
  String desc;

  BidPage(
      {required this.image,
      required this.category,
      required this.name,
      required this.desc,
      Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  BidState createState() => BidState(image, category, name, desc);
}

class BidState extends State<BidPage> {
  String imageUrl;
  String name;
  String category;
  String desc;
  BidState(this.imageUrl, this.category, this.name, this.desc);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final getHeight = mediaQuery.size.height;
    final getWidht = mediaQuery.size.width;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xffF0F8FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(
                  Iconsax.arrow_left,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Place Bid",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                child: const Icon(
                  Iconsax.more,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("tap pp");
                },
              ),
            ],
          ),
        ),
      ),
      body: FadeInUp(
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image(
                        fit: BoxFit.fill,
                        width: getWidht,
                        height: 400,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                        ),
                        padding: const EdgeInsets.only(
                            right: 15.0, left: 15.0, top: 7.0, bottom: 7.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 25,
                      child: Row(
                        children: [
                          const SizedBox(width: 10.0),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "08",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            ":",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "43",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            ":",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "26",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width * 0.5,
                      
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Iconsax.data,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      onTap: () {
                        // ignore: avoid_print
                        print("tap pp");
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "curently Bid",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "5.4 ETH",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SafeArea(
        minimum: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: Container(
          width: getWidht,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Place A Bid",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', imageUrl));
  }
}
