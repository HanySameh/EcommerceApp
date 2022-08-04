import 'package:flutter/material.dart';

class LoveButton extends StatelessWidget {
  const LoveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey,
            spreadRadius: 2,
          ),
          BoxShadow(
            blurRadius: 6,
            color: Colors.grey,
            spreadRadius: 1,
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20.0,
        child: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.favorite_outline,
            size: 25.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
