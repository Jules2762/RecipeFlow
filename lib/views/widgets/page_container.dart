import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final List<Widget> children;
  const PageContainer({super.key,required this.children});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),children: children);
  }
}
