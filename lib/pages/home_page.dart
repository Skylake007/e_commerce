import 'package:animate_do/animate_do.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:e_commerce/dummy/ads_json.dart';
import 'package:e_commerce/dummy/home_json.dart';
import 'package:e_commerce/pages/product_detail_page.dart';
import 'package:e_commerce/pages/side_menu_page.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:e_commerce/widgets/custom_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideMenuPage(),
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: primary,
      leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            AntIcons.menu_unfold,
            color: secondary,
          )),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: secondary.withOpacity(0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-1/345853560_538850731749041_6302406408270706953_n.jpg?stp=cp6_dst-jpg_p320x320&_nc_cat=103&ccb=1-7&_nc_sid=fe8171&_nc_ohc=pGzElSHLwZ0AX8uUxGz&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfA13eRah6CpxZD4HQIA_XzyYBUUhSQNbPEuojTBgO9TjA&oe=652780D0"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Chào Bin's,",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: black),
          ),
          const Text(
            "Hãy chọn gì đó nào!",
            style: TextStyle(fontSize: 15, color: black),
          ),
          const SizedBox(height: 20),
          getSliders(),
          const SizedBox(height: 20),
          getCategorySection(),
          const SizedBox(height: 20),
          getCategoryItems(),
        ],
      ),
    );
  }

  Widget getSliders() {
    return const CustomSlider(items: adsJson);
  }

  Widget getCategorySection() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gợi ý hôm nay",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: black),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: ((size.width - 30) * 0.7),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categoryItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 30,
                        decoration: pageIndex == index
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: secondary, width: 1.5)))
                            : const BoxDecoration(),
                        child: Text(
                          categoryItems[index]['title'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: pageIndex == index
                                ? secondary
                                : secondary.withOpacity(0.5),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AntIcons.search_outline,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Tìm kếm..",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget getCategoryItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(homeJson.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                        name: homeJson[index]['name'],
                        img: homeJson[index]['image'],
                        price: homeJson[index]['price'],
                        rate: homeJson[index]['rate'],
                        colors: homeJson[index]['colors']),
                  ),
                );
              },
              child: FadeIn(
                duration: Duration(milliseconds: 1000 * index),
                child: SizedBox(
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Icon(AntIcons.star_outline,
                                        size: 20, color: secondary),
                                    const SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        homeJson[index]['rate'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: secondary.withOpacity(0.15),
                                        blurRadius: 5,
                                        offset: const Offset(0, 5),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      AntIcons.shopping_outline,
                                      size: 20,
                                      color: secondary.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: SizedBox(
                          width: (size.width - 50) / 2,
                          height: 180,
                          child: Image.asset(homeJson[index]['image']),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: (size.width - 60) / 2,
                  child: Text(
                    homeJson[index]['name'],
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 60) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 13,
                            color: red,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 1),
                      Text(
                        homeJson[index]['price'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
