import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:core/core.dart';
import '../theme/theme.dart';

class ReusableAppBar extends StatelessWidget {
  const ReusableAppBar({super.key, this.onClickBack});

  final VoidCallback? onClickBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterIcon,
        color: Pallete.blueColor,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
