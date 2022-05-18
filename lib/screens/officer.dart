import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/models/adminModel.dart';
import 'package:waste_collector/screens/addMap.dart';
import 'package:waste_collector/screens/addOfficer.dart';
import 'package:waste_collector/screens/gpsAdmin.dart';
import 'package:waste_collector/screens/gpsOfficer.dart';
import 'package:waste_collector/screens/map.dart';

import '../models/fetchData.dart';
import '../models/officerModel.dart';

class officerWelcome extends StatefulWidget {
  const officerWelcome({Key? key}) : super(key: key);

  @override
  State<officerWelcome> createState() => _officerWelcomeState();
}

class _officerWelcomeState extends State<officerWelcome> {
  fetchData _fetchData = fetchData();

  @override
  void initState() {
    super.initState();
    _fetchData.fetchMyAccountAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          myData(),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/photos/customer1.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 270, 10, 0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: box,
                    width: 6,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/photos/avatar.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 320, 90, 0),
            child: Text('تمتع بخدماتنا',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 400, 15, 0),
            child: Text('من نحن ؟',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 440, 15, 0),
            child: SizedBox(
              width: 500,
              child: Text(
                "تعاني مدينة نابلس من مشكلة تراكم النفايات بشكل كبير خاصة في المناطق التجارية والصناعية كونها أحد أهم المراكز على المستوى الاقليمي في الضفة الغربية، تم انشاء هذا التطبيق لتنظيم عملية جمع النفايات لتصبح أسرع وأسهل وأكثر سلاسة ما يخفف تراكم النفايات وينعكس ايجابا على مظهر المدينة.",
                maxLines: 7,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 680, 15, 0),
            child: Text('خدماتي:',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 730, 40, 0),
            child: Row(
              children: [
                FlatButton(
                  height: 150,
                  minWidth: 120,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => map()),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: box, borderRadius: BorderRadius.circular(15)),
                      width: 120,
                      height: 150,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/photos/shortestPath.png',
                            height: 100,
                            width: 100,
                          ),
                          Text('تتبع أقصر طريق في خط السير',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'El Messiri',
                                fontSize: 16,

                                color: Colors.black,
                                decoration: TextDecoration.none,
                                //
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  height: 150,
                  minWidth: 120,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => gpsOfficer()),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: box, borderRadius: BorderRadius.circular(15)),
                      width: 120,
                      height: 150,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/photos/gps.png',
                            height: 100,
                            width: 100,
                          ),
                          Text('تتبع خط سير الشاحنات',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'El Messiri',
                                fontSize: 16,

                                color: Colors.black,
                                decoration: TextDecoration.none,
                                //
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 950, 15, 0),
            child: Text('آلية عمل التطبيق:',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 1000, 15, 0),
            child: SizedBox(
              width: 500,
              child: Text(
                "للموظف - يقوم التطبيق باختيار أقصر مسار لسير مركبة جمع النفايات بناءا على أولوية المنطقة للجمع حسب استخدام المنطقة والكثافة السكانية فيها وكمية النفايات التي تنتج منها، بالاضافة الى وقت الجمع حسب الأزمة المرورية و وقت الذروة وذلك للوصول الى مدينة نظيفة توفر نظام كفؤ لجمع النفايات.",
                maxLines: 7,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 1220, 15, 0),
            child: SizedBox(
              width: 500,
              child: Text(
                "للمواطن - يستطيع المواطن تتبع مسار شاحنات المهملات مما يمكنه من تحديد الوقت الذي تمر به الشاحنة من المنطقة المتواجد فيها والتخلص من المهملات في هذا الوقت وهذا يوفر من عدد عمليات اجمع التي تقوم بها البلدية للمنطقة الواحدة مما يقلل التكاليف المترتبة عليها.",
                maxLines: 7,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 1460, 15, 0),
            child: Text('تواصل معنا:',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1510),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: box, borderRadius: BorderRadius.circular(15)),
                    width: 350,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/photos/emergency.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Text('155',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              //
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1600),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: box, borderRadius: BorderRadius.circular(15)),
                    width: 350,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/photos/location.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('نابلس - دوار الحسين - المجمع الطابق الثامن',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              //
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1690),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: box, borderRadius: BorderRadius.circular(15)),
                    width: 350,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/photos/email.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text('NablusJsc@gmail.com',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              //
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1780),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: box, borderRadius: BorderRadius.circular(15)),
                    width: 350,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/photos/phone.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text('09-2337291',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              //
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 1900, 15, 0),
            child: Text('قيّم تطبيقنا',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 1950, 100, 0),
              child: RatingBar.builder(
                initialRating: 3,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                  }
                  return Text("");
                },
                onRatingUpdate: (rating) {
                  Text("");
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 2030),
              child: Container(
                color: greenDark,
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('دربك أقرب',
                        style: TextStyle(
                          fontFamily: 'El Messiri',
                          fontSize: 30,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          //
                        )),
                    Text('جامع النفايات الصلبة الذكي',
                        style: TextStyle(
                          fontFamily: 'El Messiri',
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          //
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Copyright 2022 Roaa Barq, Dalia Omar All rights reserved',
                        style: TextStyle(
                          fontFamily: 'Yanone Kaffeesatz',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          //
                        )),
                  ],
                ),
                // width: MediaQuery.of(context).size.width,
              )),
        ],
      )),
    );
  }

  Widget myData() {
    return FutureBuilder(
        future: _fetchData.fetchMyAccountOfficer(),
        builder: (context, snapchot) {
          var data = snapchot.data as officerModel;
          return data == null
              ? Text("جاري التحميل")
              : Padding(
                  padding: EdgeInsets.fromLTRB(20, 280, 90, 0),
                  child: Text("أهلا وسهلا بك " + data.name + " ..",
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'El Messiri',
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        //
                      )),
                );
        });
  }
}
