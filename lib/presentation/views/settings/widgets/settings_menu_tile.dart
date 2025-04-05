import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/core/constants/colors.dart';
class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
  required this.icon,
  required this.title,
  required this.subTitle,
  this.trailing,
  this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28,color:  CColors.primary,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}