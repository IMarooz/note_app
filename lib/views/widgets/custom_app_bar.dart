import 'package:flutter/material.dart';
import 'package:note_app_tharwat/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.icon, this.onPressed});
  final String? title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            title ?? 'Note App',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          CustomSearchIcon(icon: icon, onPressed: onPressed),
        ],
      ),
    );
  }
}
