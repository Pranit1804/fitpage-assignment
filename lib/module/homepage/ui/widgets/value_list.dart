import 'package:fitpage_assignment/common/common_appbar.dart';
import 'package:fitpage_assignment/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class ValueList extends StatelessWidget {
  final List<dynamic> values;
  const ValueList({Key key, this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: "Values",
      ),
      backgroundColor: Color(kBackgroundColor),
      body: Container(
        margin: EdgeInsets.only(left: 12, top: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              values.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          values[index].toString(),
                          style: kH5["regular"],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DottedLine(
                          dashColor: Colors.white,
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
