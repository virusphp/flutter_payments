import 'package:flutter/material.dart';
import 'package:payments_app/themes_app.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatefulWidget {
  const PaymentApp({Key? key}) : super(key: key);

  @override
  _PaymentAppState createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget options(int index, String title, String subtitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          // height: 50,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: selectedIndex == index
                      ? Color(0xffA60365)
                      : Color(0xff7E6F6F)
              ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  selectedIndex == index 
                    ? Image.asset('images/checked_group.png', width: 18, height: 18,) 
                    : Image.asset('images/check.png', width: 18, height: 18,),
                  SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: plantTextStyle,
                      ),
                      Text(
                        subtitle,
                        style: descTextStyle,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 23.0, right: 23.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'images/logo_app.png',
                width: 160,
                height: 119,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to ',
                  style: titleTextStyle,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                )
              ],
            ),
            SizedBox(
              height: 3.0,
            ),
            Center(
              child: Text(
                'Go unlock all feature and \nbuild your own business bigger',
                style: subTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bodyColor,
        body: SafeArea(
          child: Column(
            children: [
              header(),
              options(0, "Monthly", 'Good for starting up', "\$10"),
              options(1, "Querterly", 'Good for starting up', "\$10"),
              options(2, "Yearly", 'Good for starting up', "\$10"),
            ],
          ),
        ),
      ),
    );
  }
}
