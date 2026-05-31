import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/features/on_bording/ui/widgets/doc_doc_logo_title.dart';
import 'package:project_app/features/on_bording/ui/widgets/doctor_image_and_title.dart';
import 'package:project_app/features/on_bording/ui/widgets/text_and_button.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DocDocLogoTitle(),
                vSpace(41),
                const DoctorImageAndTitle(),
                vSpace(18),
                const TextAndButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
