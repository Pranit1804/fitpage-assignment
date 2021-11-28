import 'package:fitpage_assignment/common/common_appbar.dart';
import 'package:fitpage_assignment/common/info_tile.dart';
import 'package:fitpage_assignment/common/styles.dart';
import 'package:fitpage_assignment/module/homepage/helper/home_model.dart';
import 'package:fitpage_assignment/module/homepage/helper/home_provider.dart';
import 'package:fitpage_assignment/module/homepage/ui/widgets/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeProvider _homeProvider;
  List<HomepageModel> homepageData;
  ConnectionState connectionState = ConnectionState.active;

  set updateConnectionState(ConnectionState state) {
    setState(() {
      connectionState = state;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _homeProvider = Provider.of<HomeProvider>(context, listen: false);
      _homeProvider
          .getHomePageData()
          .then((value) => updateConnectionState = ConnectionState.done)
          .catchError((error) => print(error));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackgroundColor),
      appBar: CommonAppbar(
        title: "HomePage",
      ),
      body: Container(
        child: Consumer<HomeProvider>(
          builder: (ctx, data, _) {
            if (connectionState == ConnectionState.active) {
              return Container();
            } else if (connectionState == ConnectionState.done &&
                data.homeData != null &&
                data.homeData.length > 0) {
              homepageData = data.homeData;
              return Container(
                child: Column(
                  children: List.generate(
                      homepageData.length,
                      (index) => InfoTile(
                            data: homepageData[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => HomepageDetail(
                                        data: homepageData[index],
                                      )));
                            },
                          )),
                ),
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
