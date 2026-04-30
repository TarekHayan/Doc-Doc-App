import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_app/core/styles/images.dart';

class DocDocLogoTitle extends StatelessWidget {
  const DocDocLogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(ImagesAssets.assetsDocDocIcon));
  }
}
