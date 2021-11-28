import 'package:fitpage_assignment/common/styles.dart';
import 'package:fitpage_assignment/module/homepage/helper/home_model.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final HomepageModel data;
  final Function onTap;
  const InfoTile({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          data.name,
          style: kH3["bold"],
        ),
        subtitle: Text(
          data.tag,
          style: kH4["bold"].copyWith(
            color: data.color == "green" ? Color(kGreen) : Color(kRed),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
