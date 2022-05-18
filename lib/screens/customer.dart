import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/models/fetchData.dart';

import '../models/userModel.dart';

class customer extends StatefulWidget {
  const customer({Key? key}) : super(key: key);

  @override
  State<customer> createState() => _customerState();
}

class _customerState extends State<customer> {
  fetchData _fetchData = fetchData();
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
            padding: EdgeInsets.fromLTRB(15, 370, 15, 0),
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
            padding: EdgeInsets.fromLTRB(15, 410, 15, 0),
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
            padding: EdgeInsets.fromLTRB(15, 650, 15, 0),
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
            padding: EdgeInsets.fromLTRB(15, 700, 15, 0),
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
            padding: EdgeInsets.fromLTRB(15, 920, 15, 0),
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
            padding: EdgeInsets.fromLTRB(15, 1200, 15, 0),
            child: Text('تواصل معنا',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  //
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1250),
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
            padding: EdgeInsets.only(top: 1340),
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
            padding: EdgeInsets.only(top: 1430),
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
            padding: EdgeInsets.only(top: 1520),
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
            padding: EdgeInsets.fromLTRB(15, 1650, 15, 0),
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
              padding: EdgeInsets.fromLTRB(0, 1700, 100, 0),
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
              padding: EdgeInsets.only(top: 1780),
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
        future: _fetchData.fetchMyAccount(),
        builder: (context, snapchot) {
          var data = snapchot.data as userModel;
          // data == null ? name = "" : name = data.name;
          // data == null ? phone = "" : phone = data.phone;
          // data == null ? password = "" : password = data.password;
          // data == null ? id = "" : id = data.id;
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
