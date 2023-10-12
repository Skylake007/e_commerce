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
                  child: Icon(LineIcons.trash, size: 20, color: secondary)),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return Container();
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
