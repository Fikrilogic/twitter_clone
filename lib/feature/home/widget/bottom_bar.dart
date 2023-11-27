import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/constant.dart';
import '../../../theme/theme.dart';

class HomeBottomBar extends StatelessWidget {
  final Function(int) onTap;
  final List<BottomNavigationBarItem> children;

  const HomeBottomBar(
      {super.key,
      required this.onTap,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: Pallete.backgroundColor,
      onTap: onTap,
      items: children,
    );
  }
}
