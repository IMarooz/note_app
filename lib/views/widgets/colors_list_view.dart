import 'package:flutter/material.dart';

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
  Color(0xFFB8D8D8), // Seafoam
  Color(0xFFF7C59F), // Peach
  Color(0xFF9BB7D4), // Dusty Blue
  Color(0xFFE6CDAA), // Warm Sand
  Color(0xFFB7C8A9), // Soft Sage
  Color(0xFFD9B4E0), // Lavender
  Color(0xFFCBD7E6), // Frosted Blue
  Color(0xFFF3D6B8), // Light Apricot
  Color(0xFFBFD7C7), // Mint Gray
  Color(0xFFE7C9C0), // Blush
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
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(isActive: currentIndex == index, color: colors[index],),
            ),
          );
        },
      ),
    );
  }
}
