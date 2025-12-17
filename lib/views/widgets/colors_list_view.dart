import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_tharwat/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 22, backgroundColor: color),
          )
        :  CircleAvatar(radius: 25, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  final List<Color> colors = <Color>[
    Color(0xFF2F4C73), // Slate Blue
    Color(0xFF818E91), // Stone Gray
    Color(0xFF9A8373), // Warm Taupe
    Color(0xFF524344), // Cocoa Deep
    Color(0xFFF2CA80), // Soft Amber
    Color(0xFFBE5519), // Burnt Sienna
    Color(0xFFEB5582), // Strawberry Pink
    Color(0xFF6E1E28), // Merlot
    Color(0xFF4A6A5A), // Teal Moss
    Color(0xFF7A5A45), // Clay Brown 
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(isActive: currentIndex == index, color: colors[index],),
            ),
          );
        },
      ),
    );
  }
}
