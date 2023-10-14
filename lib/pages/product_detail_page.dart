import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;

  const ProductDetailPage(
      {super.key,
      required this.name,
      required this.img,
      required this.price,
      required this.rate,
      required this.colors});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      title: const Text(
        "Chi tiết sản phẩm",
        style: TextStyle(
            fontSize: 18, color: secondary, fontWeight: FontWeight.bold),
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
            border: Border.all(color: secondary.withOpacity(0.5)),
          ),
          child: Center(
            child: Icon(Icons.arrow_back_ios_new_outlined,
                size: 15, color: secondary.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Row(children: [
            const Icon(LineIcons.star, size: 20),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text("${widget.rate} đánh giá",
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ),
          ]),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "\$",
                    style: TextStyle(
                        fontSize: 16, color: red, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withOpacity(0.15),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: const Center(
                  child: Icon(
                    LineIcons.heart,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: List.generate(widget.colors.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Stack(children: [
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: secondary.withOpacity(0.1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(widget.colors[index]),
                              ),
                            ]),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: FadeIn(
                    child: SizedBox(
                      height: 350,
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(0.12),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(120),
                                  topLeft: Radius.circular(120),
                                  topRight: Radius.circular(40)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 270,
                          child: Image.asset(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                  width: size.width * 0.15,
                  child: const Text(
                    "Sizes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(16, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: secondary.withOpacity(0.2),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              (index / 2 + 37).toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "Số lượng ",
            style: TextStyle(
              color: white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(child: Icon(Icons.remove)),
                      ),
                      const Text(
                        "1",
                        style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(child: Icon(Icons.add)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withOpacity(0.15),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    LineIcons.shoppingBag,
                    size: 23,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
