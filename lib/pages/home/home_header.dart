import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Image.network(
                  "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,"),
                Text(
                  "Warlord",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromARGB(126, 158, 158, 158),
              borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            CupertinoIcons.bell,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
