import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:login/view/pages/homeScreen.dart';
import 'package:login/view/pages/mapScreen.dart';
import 'package:login/view/pages/reportScreen.dart';
import 'package:login/view/pages/settingScreen.dart';

class NavigationScreen extends StatefulWidget {
  
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentpage = 0;

  GlobalKey bottomNavigationkey = GlobalKey();

  List<Widget> _paginas = [
    HomeScreen(),
    MapScreen(),
    ReportScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Bottom Navigation Bar"),
      //   backgroundColor: Colors.blue,
      // ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //   ),
      //   child: Center(
      //     child: _getpage(currentpage),
      //   ),
      // ),
      body: _paginas[currentpage],
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home,title: "Home"),
          TabData(iconData: Icons.map,title: "Bản đồ"),
          TabData(iconData: Icons.warning,title: "Báo cáo"),
          TabData(iconData: Icons.settings,title: "Thiết lập"),
        ],
        initialSelection: currentpage,
        circleColor: Colors.indigo[900],
        inactiveIconColor: Colors.indigo[900],
        textColor: Colors.indigo[900],
        key: bottomNavigationkey,
        onTabChangedListener: (position){
          setState(() {
            currentpage = position;
          });
        },
      ),
    );
  }

  // _getpage(int page){
  //   switch(page){
  //     case 0:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("Home page",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 35,
  //           ),
  //           ),
  //         ],
  //       );

  //     case 1:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("Bản đồ",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 35,
  //           ),
  //           ),
  //         ],
  //       );
      
  //     case 2:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("Báo cáo",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 35,
  //           ),
  //           ),
  //         ],
  //       );

  //     default:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("Thiết lập",
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 35,
  //           ),
  //           ),
  //         ],
  //       );
  //   }
  // }

}

