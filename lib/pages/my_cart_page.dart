import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/my_card_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      title: const Text(
        "Cart",
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
                  child:
                      Icon(LineIcons.shoppingBag, size: 20, color: secondary)),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCartLists(),
        ],
      ),
    );
  }

  Widget getCartLists() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(myCartJson.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: FadeIn(
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 30) * 0.7,
                  height: 80,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          myCartJson[index]['image']),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 10,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: secondary.withOpacity(0.2)),
                                  color: secondary.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(myCartJson[index]['name'],
                          style: const TextStyle(fontSize: 16), maxLines: 2),
                      Row(
                        children: [
                          const Text(
                            "\$",
                            style: TextStyle(
                                color: red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            myCartJson[index]['price'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
