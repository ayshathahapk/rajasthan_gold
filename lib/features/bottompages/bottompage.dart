import 'package:flutter/material.dart';
import 'package:rajasthan_gold/features/bottompages/ratealert.dart';
import 'package:rajasthan_gold/features/bottompages/showpage.dart';
import 'package:rajasthan_gold/features/bottompages/spotrate.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SpotRate(),
    RateAlert(),
  ];

  void _onNavigationBarTap(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Showpage();
        },
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFD3AF37),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Color(0xFFD3AF37),
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        buttonBackgroundColor: Colors.white60,
        height: 70,
        index: _currentIndex,
        color: Colors.white54,
        onTap: _onNavigationBarTap,
        items: <Widget>[
          // Icon(Icons.bar_chart_outlined, size: 17, color:Color(0xFFD3AF37)),
          // Icon(Icons.notifications_on, size: 17, color: Color(0xFFD3AF37)),
          // Icon(Icons.more, size: 17, color:Color(0xFFD3AF37)),
          Icon(Icons.bar_chart_outlined, size: 17, color:Colors.black),
          Icon(Icons.notifications_on, size: 17,  color:Colors.black),
          Icon(Icons.more, size: 17,  color:Colors.black),
        ],
      ),
    );
  }
}



