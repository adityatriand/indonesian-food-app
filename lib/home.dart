import 'package:flutter/material.dart';
import 'package:flutter_myapp/kembang_tahu.dart';
import 'dawet_ayu.dart';
import 'siomay.dart';
import 'bakso.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget{
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, left: 50, right: 10),
                  child: Text('Aneka Ragam Makanan Indonesia',
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold)
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 130),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                  children: [
                                    Center(
                                        child: Image(
                                          image: AssetImage(
                                              "images/image1.jpg"),
                                          alignment: Alignment.center,
                                        )
                                    ),
                                    SizedBox(
                                        height: 10.0
                                    ),
                                    Text(
                                        'Indonesia selain memiliki ragam budaya, suku, dan bahasa. '
                                            'Indoesia juga memiliki aneka ragam makanan dengan citra rasa '
                                            'khas rempah rempah dari indonesia ')
                                  ]
                              )
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                children: [
                                  Expanded(
                                    child: Image(image: AssetImage(
                                        "images/image2.jpg")),
                                  ),
                                  SizedBox(
                                      width: 10.0
                                  ),
                                  Expanded(
                                    child: Image(image: AssetImage(
                                        "images/image3.jpg")),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        'Siomay merupakan makanan yang terbuat dari '
                                            'olahan ikan dengan ditaburi bumbu kacang yang kaya akan rempah. '
                                            'Siomay berasal dari kota bandung. '
                                            'Varian dari siomay pun ada dikombinasikan '
                                            'dengan tahu, telur, dan sayur-sayuran', textAlign: TextAlign.justify),
                                  ),
                                  SizedBox(
                                      width: 10.0
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Bakso merupakan makanan yang terbuat dari '
                                            'olahan daging sapi dengan diberi kuah yang kaya akan '
                                            'rempah rempah citra rasa khas indonesia. '
                                            'Bakso berasal dari kota malang dan solo. '
                                            'Varian dari bakso terdiri dari bakso daging, '
                                            'bakso telur, dan bakso tahu', textAlign: TextAlign.justify),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Siomay())
                                          );
                                        },
                                        child: Text('Lihat Detail',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                                    ),
                                  ),
                                  SizedBox(
                                      width: 10.0
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Bakso())
                                          );
                                        },
                                        child: Text('Lihat Detail',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 50, right: 10),
                            child: Text('Aneka Ragam Minuman Indonesia',
                                style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold)
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 80),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                            children: [
                                              Center(
                                                  child: Image(
                                                    image: AssetImage(
                                                        "images/image4.jpg"),
                                                    alignment: Alignment.center,
                                                  )
                                              ),
                                              SizedBox(
                                                  height: 10.0
                                              ),
                                              Text(
                                                  'Indonesia selain memiliki ragam makanan, '
                                                      'Indoesia juga memiliki aneka ragam minuman dengan citra rasa '
                                                      'khas dari indonesia ')
                                            ]
                                        )
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: Image(image: AssetImage(
                                                  "images/image5.jpg")),
                                            ),
                                            SizedBox(
                                                width: 10.0
                                            ),
                                            Expanded(
                                              child: Image(image: AssetImage(
                                                  "images/image6.jpg")),
                                            ),
                                          ]
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Kembang Tahu adalah minuman dengan aroma jahe, gula aren'
                                                      'dan tahu dicampur dengan es', textAlign: TextAlign.justify),
                                            ),
                                            SizedBox(
                                                width: 10.0
                                            ),
                                            Expanded(
                                              child: Text(
                                                  'Dawet ayu adalah minuman dengan gula aren, santen, dan dicampur'
                                                      'dengan dawet yang berasal dari daun pandan.'
                                                      'bisa disajikan hangat atau dingin', textAlign: TextAlign.justify),
                                            ),
                                          ]
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Kembang_Tahu())
                                                    );
                                                  },
                                                  child: Text('Lihat Detail',style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white)),
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                                              ),
                                            ),
                                            SizedBox(
                                                width: 10.0
                                            ),
                                            Expanded(
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Dawet_Ayu())
                                                    );
                                                  },
                                                  child: Text('Lihat Detail',style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white)),
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ]
                              )
                          )
                        ]
                    )
                )

              ]
          )
      )
    );
  }
}