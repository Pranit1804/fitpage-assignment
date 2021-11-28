import 'package:fitpage_assignment/module/homepage/helper/home_model.dart';
import 'package:fitpage_assignment/module/homepage/helper/homepage_service.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  BaseHomepageService _homepageService = HomeapageService();
  List<HomepageModel> _homepageModel;

  set homePageData(String data) => _homepageModel = homepageModelFromJson(data);

  List<HomepageModel> get homeData => _homepageModel;

  Future getHomePageData() async {
    String _res = await _homepageService.getHomepageData();
    homePageData = _res;
    notifyListeners();
  }
}
