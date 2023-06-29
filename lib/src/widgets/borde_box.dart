import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? width, height;

  const BorderBox(
      {Key? key, this.padding, this.width, this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.white,
      borderRadius: BorderRadius.circular(70),
      elevation: 2,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(70),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromARGB(255, 253, 253, 255),
            ],
          ),
          /*
          border: Border.all(
            color: Colors.grey.withAlpha(40),
            width: 2,
          ),
          */
        ),
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
