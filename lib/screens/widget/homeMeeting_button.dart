import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const HomeMeetingButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ));
  }
}
