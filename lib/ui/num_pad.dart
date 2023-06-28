import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final Function(String) onKeyPressed;

  const NumPad({Key? key, required this.onKeyPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          final title = index < 9
              ? (index + 1).toString()
              : index == 9
                  ? '.'
                  : index == 10
                      ? '0'
                      : '⌫';
          return TextButton(
            onPressed: () => onKeyPressed(title),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
