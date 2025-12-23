import 'package:flutter_components_lab/pages/counter.dart';
import 'package:flutter_components_lab/pages/select_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components_lab/pages/Buttons.dart';
import 'package:flutter_components_lab/pages/dropdown_popup.dart';
import 'package:flutter_components_lab/pages/imagewidget.dart';
import '../enums/menu_item.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack, // Hero'yu kapatır
      /*
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          debugPrint("Cancel");
        },
      ),
      */
      title: Text(title),
      // backgroundColor: Colors.amber,
      centerTitle: true,
      actions: [
        PopupMenuButton<MenuItemType>(
          onSelected: (item) {
            if (item == MenuItemType.Buttons) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Butons()),
              );
            } else if (item == MenuItemType.Image_Widget) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImageWidget()),
              );
            } else if (item == MenuItemType.DropDownPopup) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DropdownPopup()),
              );
            } else if (item == MenuItemType.SelectColor) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySelectTheColor(),
                ),
              );
            } else if (item == MenuItemType.Counter) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Counter(),
                ),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: MenuItemType.Buttons,
              child: Text('Buttons'),
            ),
            const PopupMenuItem(
              value: MenuItemType.Image_Widget,
              child: Text('Image Widgets'),
            ),
            const PopupMenuItem(
              value: MenuItemType.DropDownPopup,
              child: Text('Dropdown Popup'),
            ),
            const PopupMenuItem(
              value: MenuItemType.Counter,
              child: Text('Counter App'),
            ),
            const PopupMenuItem(
              value: MenuItemType.SelectColor,
              child: Text('The Colour Selector App'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
