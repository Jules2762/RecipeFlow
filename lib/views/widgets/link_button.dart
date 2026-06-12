import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final IconData icon;
  const LinkButton({
    super.key,
    this.onPress,
    required this.text,
    this.icon = Icons.arrow_right,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      
      child: Row(children: [Text(text), const SizedBox(width: 4,),Icon(icon)]),
    );
  }
}
