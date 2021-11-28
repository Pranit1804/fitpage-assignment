import 'package:fitpage_assignment/common/common_appbar.dart';
import 'package:fitpage_assignment/common/styles.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Map<String, dynamic> values;
  const Indicator({Key key, this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = values["default_value"].toString();
    return Scaffold(
      backgroundColor: Color(kBackgroundColor),
      appBar: CommonAppbar(
        title: values["study_type"].toString().toUpperCase(),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Parameter',
              style: kH3["regular"],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Period',
                      style: kH3["regular"].copyWith(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onFieldSubmitted: (String value) {
                        if (int.parse(value) < values["min_value"] ||
                            int.parse(value) > values["max_value"]) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Wrong input',
                              style: kH4["regular"],
                            ),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      maxLines: 1,
                      style: kH4["regular"].copyWith(color: Colors.black),
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintStyle: kH3["regular"].copyWith(color: Colors.black),
                        hintText: "Enter value",
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
