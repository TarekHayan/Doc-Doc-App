import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/features/auth/logic/cubit/signup_cubit.dart';

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({super.key});

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedGender,
      decoration: InputDecoration(
        fillColor: AppColors.morelighterGreyColor,
        hintText: "Gender",
        enabledBorder: _borderRadius(AppColors.lighterGreyColor),
        focusedBorder: _borderRadius(AppColors.primaryColorBlue),
        errorBorder: _borderRadius(Colors.redAccent),
      ),
      items: ["Male", "Female"].map((gender) {
        return DropdownMenuItem(value: gender, child: Text(gender));
      }).toList(),
      onChanged: (value) {
        setState(() {
          context.read<SignupCubit>().selectedGender = value;
          selectedGender = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Please select gender";
        }
        return null;
      },
    );
  }
}

OutlineInputBorder _borderRadius(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color, width: 1.3),
  );
}
