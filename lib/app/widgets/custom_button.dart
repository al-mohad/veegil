import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/app/modules/home/controllers/home_controller.dart';

class CustomButton extends GetView<HomeController> {
  final String text;
  final IconData icon;
  final Function onTap;
  final Color color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color,
                  offset: const Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 0.2,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 35, color: color),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
