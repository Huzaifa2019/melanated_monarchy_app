import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './myPurchaseAll.dart';
import './noPurchase.dart';

class MyPurchase extends StatefulWidget {
  @override
  _MyPurchaseState createState() => _MyPurchaseState();
}

class _MyPurchaseState extends State<MyPurchase> {
  bool isPurchase = true;

  @override
  Widget build(BuildContext context) {
    Color golden = Color.fromRGBO(231, 198, 142, 1.0);
    Color goldenDull = Color.fromRGBO(231, 198, 142, 0.7);

    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: golden,
          // title: Text('Menu'),
          toolbarHeight: 150,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    iconSize: 36,
                    color: golden,
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Container(
                  width: size.width * 0.80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.6,
                        color: golden,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPurchase = !isPurchase;
                      });
                    },
                    child: Text(
                      'My Purchase',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: golden,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width - 20,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  child: TabBar(
                    dragStartBehavior: DragStartBehavior.start,
                    unselectedLabelColor: goldenDull,
                    labelColor: golden,
                    indicatorPadding: EdgeInsets.all(0),
                    labelPadding: EdgeInsets.all(0),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 0,
                      ),
                      insets: EdgeInsets.zero,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      setState(() {});
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Delivered',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Packed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Dispatched',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          // bottom:

          backgroundColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            (isPurchase) ? MyPurchaseAll() : NoPurchase(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
