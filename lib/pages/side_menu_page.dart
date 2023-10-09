import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/side_menu_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({super.key});

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          getHeader(),
          getBody(),
          getFooter(),
        ],
      ),
    );
  }

  Widget getHeader() {
    return SizedBox(
      height: 160,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-1/345853560_538850731749041_6302406408270706953_n.jpg?stp=cp6_dst-jpg_p320x320&_nc_cat=103&ccb=1-7&_nc_sid=fe8171&_nc_ohc=pGzElSHLwZ0AX8uUxGz&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfA13eRah6CpxZD4HQIA_XzyYBUUhSQNbPEuojTBgO9TjA&oe=652780D0'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Xin chào,",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Text(
              "Nguyễn Thanh Bình",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]['selected']) {
          return FadeInLeft(
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: white,
                    border: Border.all(color: secondary.withOpacity(0.03)),
                    boxShadow: [
                      BoxShadow(
                          color: secondary.withOpacity(0.03),
                          blurRadius: 2.5,
                          offset: const Offset(0, 5)),
                    ]),
                child: ListTile(
                  onTap: () {
                    print("Selected item");
                  },
                  minLeadingWidth: 10,
                  leading: Icon(sideMenuItems[index]['icon'], color: secondary),
                  title: Text(sideMenuItems[index]['label'],
                      style: const TextStyle(fontSize: 16, color: secondary)),
                ),
              ),
            ),
          );
        }
        return FadeInLeft(
          duration: Duration(milliseconds: index * 250),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => sideMenuItems[index]['page']));
              },
              minLeadingWidth: 10,
              leading: Icon(
                sideMenuItems[index]['icon'],
                color: secondary,
              ),
              title: Text(
                sideMenuItems[index]['label'],
                style: const TextStyle(fontSize: 16, color: secondary),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getFooter() {
    return Column(
      children: [
        const Divider(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              LineIcons.alternateSignOut,
              color: secondary,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 16, color: secondary),
            ),
          ),
        ),
      ],
    );
  }
}
