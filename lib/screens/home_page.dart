import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rock_app/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../models/rock_model.dart';
import '../services/rock_service.dart';
import 'detail_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePage> {
  bool _isLoading = false;
  List<RockModel> rockList = [];
  List<RockModel> rockSearchList = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _getAllData();
  }

  Future<void> _getAllData() async {
    setState(() => {_isLoading = true});
    RockService()
        .getListData()
        .then((value) => {
              print("value: ${value[0].rockNameEn}"),
              setState(() => {_isLoading = false}),
              if (value.isNotEmpty)
                {
                  setState(() => {rockList = value, rockSearchList = value}),
                }
            })
        .onError((error, stackTrace) => {
              setState(() => {_isLoading = false})
            });
  }

  void _onRefresh() async {
    print("_onRefresh");
    await _getAllData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("_onLoading");
    _getAllData();
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  void _runFilter(String enteredKeyword) {
    print("enteredKeyword: ${enteredKeyword}");
    List<RockModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = rockSearchList;
    } else {
      results = rockList
          .where((data) =>
              data.rockNameTh
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              data.rockNameEn
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              data.rockColor
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              data.rockHardness
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    //
    // // Refresh the UI
    setState(() {
      rockList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      child: Container(
        color: const Color(0xFF362C36),
        child: Column(
          children: [
            const SizedBox(height: 64),
            _searchView(),
            if (_isLoading)
              Container(
                margin: EdgeInsets.only(top: 64),
                child: CircularProgressIndicator(),
              )
            else if (rockList.isNotEmpty)
              Expanded(
                child: GridView.count(
                    // crossAxisCount is the number of columns
                    crossAxisCount: 2,
                    children: rockList.map<Widget>((item) {
                      return Container(
                          // margin: EdgeInsets.only(left: 8, right: 8),
                          child: _renderItem(item));
                      // do the build here
                    }).toList()),
              )
            else
              Container(
                margin: EdgeInsets.only(top: 64),
                child: const Text(
                  "ไม่ค้นพบข้อมูล",
                  style: TextStyle(color: Colors.white),
                ),
              )
          ],
        ),
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enablePullDown: true,
      enablePullUp: true,
      header: MaterialClassicHeader(),
    ));
  }

  Widget _renderItem(RockModel rockModel) {
    return InkWell(
      child: Card(
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  rockModel.rockImage,
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Text(
                rockModel.rockNameEn,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                rockModel.rockNameTh,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(rockModel: rockModel),
        ),
      ),
    );
  }

  Widget _searchView() {
    return Align(
        alignment: const Alignment(0.0, 1.25),
        child: Container(
            height: MediaQuery.of(context).size.height / 18,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      spreadRadius: .5,
                      offset: Offset(
                        0.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: TextField(
                    onSubmitted: (submittedText) {},
                    onChanged: _runFilter,
                    decoration: InputDecoration(
                        hintText: "ค้นหาหิน/แร่...",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black38,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(25)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(25)))))));
  }
}
