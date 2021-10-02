import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String title;
  final IconData iconData;

  const BuildCard({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      selectedTileColor: Colors.blueGrey,
      tileColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Container(
        height: double.infinity,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 32,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}
