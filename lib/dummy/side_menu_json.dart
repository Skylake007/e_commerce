import 'package:ant_icons/ant_icons.dart';
import 'package:e_commerce/pages/favorite_page.dart';
import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/my_cart_page.dart';
import 'package:e_commerce/pages/order_page.dart';
import 'package:line_icons/line_icons.dart';

List sideMenuItems = [
  {
    "label": "Home",
    "selected": true,
    "icon": AntIcons.home_outline,
    "page": const HomePage()
  },
  {
    "label": "My Cart",
    "selected": false,
    "icon": LineIcons.shoppingCart,
    "page": const MyCartPage()
  },
  {
    "label": "Favorite",
    "selected": false,
    "icon": LineIcons.heart,
    "page": const FavoritePage()
  },
  {
    "label": "Orders",
    "selected": false,
    "icon": LineIcons.history,
    "page": const OrderPage()
  },
];
