import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {

  String title, subtitle;
  IconData leadingIcon, trailingIcon;
  Color? listTileColor, iconColor;

  ListTileWidget({super.key,
    required this.title,
    required this.subtitle,
      this.leadingIcon = Icons.label,
      this.trailingIcon = Icons.add_shopping_cart,
      this.listTileColor,
      this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:   EdgeInsets.all(5),
        child: ListTile(
          tileColor: listTileColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:  BorderSide(
                width: 1,
                color: Colors.blue),
          ),
          title: Text(
              title,
              style:  TextStyle(fontSize: 20)),
          subtitle: Text(subtitle, style:  TextStyle(fontSize: 15)),
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