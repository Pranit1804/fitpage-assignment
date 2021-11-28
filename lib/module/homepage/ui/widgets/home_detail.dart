import 'package:fitpage_assignment/common/common_appbar.dart';
import 'package:fitpage_assignment/common/info_tile.dart';
import 'package:fitpage_assignment/common/styles.dart';
import 'package:fitpage_assignment/common/tools.dart';
import 'package:fitpage_assignment/module/homepage/helper/home_model.dart';
import 'package:fitpage_assignment/module/homepage/ui/widgets/indicator.dart';
import 'package:fitpage_assignment/module/homepage/ui/widgets/value_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomepageDetail extends StatefulWidget {
  final HomepageModel data;
  const HomepageDetail({Key key, this.data}) : super(key: key);

  @override
  _HomepageDetailState createState() => _HomepageDetailState();
}

class _HomepageDetailState extends State<HomepageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackgroundColor),
      appBar: CommonAppbar(title: "HomePage"),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(kBlue),
              child: InfoTile(
                data: widget.data,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.data.criteria.length, (index) {
                List<Criterion> _criteria = widget.data.criteria;
                return _buildDetailWidget(_criteria[index], index);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailWidget(Criterion data, int index) {
    if (data.type == "plain_text") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index > 0)
            Text(
              "\nand \n",
              style: kH5['regular'],
            ),
          Text(
            data.text,
            textAlign: TextAlign.start,
            style: kH3["regular"],
          ),
        ],
      );
    } else if (data.type == "variable") {
      List<TextHelper> separatedText = Tools.getReplacedString(data);
      return _buildVariableDetail(index: index, data: separatedText);
    } else
      return Container(
        child: Text('Something went wrong'),
      );
  }

  Widget _buildVariableDetail({int index, List<TextHelper> data}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index > 0)
          Text(
            "\nand \n",
            style: kH5['regular'],
          ),
        RichText(
          text: TextSpan(
            children: List.generate(
              data.length,
              (index) => TextSpan(
                  text: data[index].text,
                  style: kH4["regular"].copyWith(
                      color: data[index].isLink
                          ? Color(kBlue)
                          : Color(kFontColor)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (data[index].isLink) {
                        if (data[index].values["type"] == "value") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ValueList(
                              values: data[index].values["values"],
                            ),
                          ));
                        } else if (data[index].values["type"] == "indicator") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Indicator(
                              values: data[index].values,
                            ),
                          ));
                        } else {
                          print('Error');
                        }
                      }
                    }),
            ),
          ),
        ),
      ],
    );
  }
}
