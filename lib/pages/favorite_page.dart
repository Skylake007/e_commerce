import 'package:e_commerce/dummy/favourite_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      title: const Text(
        "Danh sách yêu thích",
        style: TextStyle(
            fontSize: 18, color: secondary, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2))),
          child: const Center(
            child: Icon(Icons.arrow_back_ios_new, size: 15, color: secondary),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("shopingbag");
          },
          icon: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: secondary.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: secondary.withOpacity(0.15),
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: const Center(
              child: Center(
                child: Icon(LineIcons.trash, size: 20, color: secondary),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(favoriteJson.length, (index) {
              return Column(
                children: [
                  SizedBox(
                    width: (size.width - 50) / 2,
                    height: 220,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          child: Container(
                            width: (size.width - 50) / 2,
                            height: 200,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: favoriteJson[index]['active'] ? 1.2 : 0,
                                color: favoriteJson[index]['active']
                                    ? secondary.withOpacity(0.5)
                                    : Colors.transparent,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 10),
                                  child: Row(
                                    children: [
                                      const Icon(LineIcons.star,
                                          size: 20, color: secondary),
                                      const SizedBox(width: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          favoriteJson[index]['rate'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: secondary.withOpacity(0.15),
                                          blurRadius: 5,
                                          offset: const Offset(0, 5)),
                                    ], shape: BoxShape.circle, color: white),
                                    child: Center(
                                      child: Icon(
                                          favoriteJson[index]['active']
                                              ? LineIcons.heartAlt
                                              : LineIcons.heart,
                                          size: 18,
                                          color: secondary),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          child: SizedBox(
                            width: (size.width - 50) / 2,
                            height: 180,
                            child: Image.asset(favoriteJson[index]['image'],
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        favoriteJson[index]['name'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: (size.width - 60) / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "\$",
                              style: TextStyle(
                                  color: red,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              favoriteJson[index]['price'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Thanh toán ngay",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
