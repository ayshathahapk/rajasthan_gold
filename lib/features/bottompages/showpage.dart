import 'package:flutter/material.dart';
import '../../main.dart';
import 'bankdetails.dart';
import 'about.dart';
import 'news.dart';

class Showpage extends StatefulWidget {
  const Showpage({super.key});

  @override
  State<Showpage> createState() => _ShowpageState();
}

class _ShowpageState extends State<Showpage> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: height * 0.25,
        width: width,
        child: ListView(
          children:
          <Widget>[
            ListTile(
              leading: Icon(Icons.newspaper), // Icon for 'New'
              title: Text('News'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => News(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance), // Icon for 'Bank Details'
              title: Text('Bank Details'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person), // Icon for 'Bank Details'
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About(),));
              },
            ),
          ],
        ),

      );
  }
}



