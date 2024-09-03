import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rajasthan_gold/bankdetails/five.dart';
import 'package:rajasthan_gold/spotrate/one.dart';
import 'package:rajasthan_gold/news/three.dart';
import 'package:rajasthan_gold/ratealert/two.dart';
import 'package:rajasthan_gold/profile/foure.dart';

import '../main.dart';


List<Map<String, dynamic>> text = [
  {'text': 'Live rate', 'icon': Icon(Icons.bar_chart, color: Color(0xFFBFA13A), size: 30)},
  {'text': 'Rate Alert', 'icon': Icon(Icons.notifications_active, color: Color(0xFFBFA13A), size: 30)},
  {'text': 'News', 'icon': Icon(Icons.new_releases, color: Color(0xFFBFA13A), size: 30)},
  {'text': 'About Us', 'icon': Icon(Icons.person, color: Color(0xFFBFA13A), size: 30)},
  {'text': 'Bank Details', 'icon': Icon(Icons.maps_home_work_rounded, color: Color(0xFFBFA13A), size: 30)},
  {'text': 'Coming Soon', 'icon': Icon(Icons.add_circle_sharp, color: Color(0xFFBFA13A), size: 30)},
];

List<Widget> pages = [
  One(),
  Two(),
  Three(),
  Foure(),
  Five(),
];

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.black,
        title: Text('Rajasthan Gold', style: TextStyle(fontStyle: FontStyle.italic,fontWeight:FontWeight.w500,color: Color(0xFFBFA13A))),
      ),
      body: Container(height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/raj.png'),
            fit: BoxFit.cover, // Cover the entire body area
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.2,
            ),
            itemCount: text.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index < pages.length) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  } else {
                    print('Page index out of bounds');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text[index]['icon'],
                      SizedBox(height: 10),
                      Text(
                        text[index]['text'],
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
