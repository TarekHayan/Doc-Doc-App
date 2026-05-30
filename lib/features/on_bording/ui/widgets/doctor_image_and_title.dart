import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/core/styles/images.dart';

class DoctorImageAndTitle extends StatelessWidget {
  const DoctorImageAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SvgPicture.asset(Assets.assetsImagesDocBackground),
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
                begin: AlignmentGeometry.bottomCenter,
                end: AlignmentGeometry.topCenter,
                stops: const [0.14, 0.4],
              ),
            ),
            child: Image.asset(Assets.assetsImagesDoctorImage),
          ),
          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: Text(
              "Best Doctor \n Appointment App",
              textAlign: TextAlign.center,
              style: AppFonts.fontSize32BoldPrim,
            ),
          ),
        ],
      ),
    );
  }
}
