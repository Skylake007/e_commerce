import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/my_card_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
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
      bottomNavigationBar: getBottom(),
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
          const SizedBox(height: 20),
          getPromotionCode(),
          const SizedBox(height: 30),
          getSummary(),
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
                                    image:
                                        AssetImage(myCartJson[index]['image']),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myCartJson[index]['name'],
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2,
                        ),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              const Flexible(
                child: SizedBox(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close, size: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(LineIcons.minusSquare),
                          SizedBox(width: 10),
                          Text(
                            "1",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          Icon(LineIcons.plusSquare),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }));
  }

  Widget getPromotionCode() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: secondary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: secondary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mã giảm giá",
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.3),
                    border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Text("Chọn mã")),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Tổng tiền hàng",
              style: TextStyle(
                  fontSize: 16, color: secondary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            const Text(
              "(3sp)",
              style: TextStyle(color: secondary, fontSize: 16),
            ),
            Dash(
              length: 155,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const Text(
              "\$600",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Text(
              "Phí vận chuyển",
              style: TextStyle(
                  fontSize: 16, color: secondary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Dash(
              length: 160,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const Text(
              "Miễn phí",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Text(
              "Tổng ",
              style: TextStyle(
                  fontSize: 16, color: secondary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Dash(
              length: 260,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const Text(
              "\$600",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget getBottom() {
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
