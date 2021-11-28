import 'package:fitpage_assignment/module/homepage/helper/home_model.dart';

class Tools {
  static List<TextHelper> getReplacedString(Criterion data) {
    List<TextHelper> allTexts = [];
    int index = 0;
    String linkText;
    int prevVarIndex;
    String remainingText = "";
    int currPointer = 0;
    data.variable.forEach((key, value) {
      int varIndex = data.text.indexOf(key);
      if (varIndex != currPointer) {
        if (index == 0) {
          allTexts.add(TextHelper(text: data.text.substring(0, varIndex)));
        } else {
          allTexts.add(TextHelper(
              text: data.text
                  .substring(prevVarIndex + linkText.length, varIndex)));
        }
      }

      if (value["type"] == "value") {
        linkText = value["values"][0].toString();
        allTexts.add(TextHelper(
          text: value["values"][0].toString(),
          values: value,
          isLink: true,
        ));
        currPointer = varIndex + value["values"][0].toString().length;
        remainingText = data.text.substring(varIndex);
      } else if (value["type"] == "indicator") {
        linkText = value["default_value"].toString();
        allTexts.add(TextHelper(
          text: value["default_value"].toString(),
          isLink: true,
          values: value,
        ));
        currPointer = varIndex + value["default_value"].toString().length;
        remainingText = data.text.substring(varIndex + linkText.length);
      }
      prevVarIndex = varIndex;
      index++;
    });
    if (remainingText.isNotEmpty && !remainingText.contains("\$")) {
      allTexts.add(TextHelper(text: remainingText));
    }
    return allTexts;
  }

  // static String formatString(String value) {
  //   String formattedString =
  //       value.replaceAll(">", "greater than").replaceAll("<", "less than");
  //   return formattedString;
  // }
}
