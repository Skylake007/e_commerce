import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/order_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        "Lịch sử đặt hàng",
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
            print("Del");
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
            "Đặt lại",
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

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        const SizedBox(height: 10),
        getTab(),
        const SizedBox(height: 30),
        getItemsList(),
      ]),
    );
  }

  Widget getTab() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: secondary.withOpacity(0.05),
      ),
      child: Row(
        children: [
          pageIndex == 0
              ? Flexible(
                  child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: secondary.withOpacity(0.15),
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                )
                              ]),
                          child: const Center(
                            child: Text("Đang giao hàng",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          )),
                    ),
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Đang giao hàng",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: secondary.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                ),
          pageIndex == 1
              ? Flexible(
                  child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: secondary.withOpacity(0.15),
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                )
                              ]),
                          child: const Center(
                            child: Text(
                              "Đã giao hàng",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Đã giao hàng",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secondary.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  dynamic getData(String stringValue, int index) {
    var data = pageIndex == 0
        ? currentOrderList[index][stringValue]
        : pastOrderList[index][stringValue];
    return data;
  }

  Widget getItemsList() {
    var size = MediaQuery.of(context).size;

    return Column(
      children: List.generate(
          pageIndex == 0 ? currentOrderList.length : pastOrderList.length,
          (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: size.width,
            //height: 200,
            decoration: BoxDecoration(
              color: secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getData('date', index),
                        style: const TextStyle(
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Đang xử lý đơn hàng",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
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
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(getData('image', index)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getData('name', index),
                                    style: const TextStyle(fontSize: 16),
                                    maxLines: 2,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("\$",
                                          style: TextStyle(
                                              color: red, fontSize: 14)),
                                      Text(
                                        getData('price', index),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              width: 1,
                              height: 60,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.15),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Số lượng 1",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  getData('time', index),
                                  style: TextStyle(
                                      color: secondary.withOpacity(0.5),
                                      fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
