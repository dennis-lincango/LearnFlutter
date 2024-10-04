import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {

  final String title, subtitle;
  final IconData leadingIcon, trailingIcon;
  final Color? listTileColor, iconColor;

  const ListTileWidget({super.key,
    required this.title,
    required this.subtitle,
    required  this.leadingIcon,
    required  this.trailingIcon,
    required  this.listTileColor,
    required  this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:     const EdgeInsets.all(5),
        child: ListTile(
          tileColor: listTileColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:    const BorderSide(
                width: 1,
                color: Colors.blue),
          ),
          title: Text(
              title,
              style:  const TextStyle(fontSize: 20)),
          subtitle: Text(subtitle, style:    const TextStyle(fontSize: 15)),
          leading: IconButton(
            icon: Icon(leadingIcon), onPressed: (){} ,
            color: iconColor),
          trailing: IconButton(
            icon: Icon(trailingIcon), onPressed: (){},
            color: iconColor),
        )
    );
  }
}