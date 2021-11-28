import 'package:fitpage_assignment/common/styles.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSize {
  final String title;
  const CommonAppbar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title != null ? title : "",
        style: kH2["bold"],
      ),
      centerTitle: false,
    );
  }

  @override
  Widget get child => null;

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
