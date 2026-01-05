import 'dart:convert';

import 'package:converter/getMonyMap.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  Money input = Money(0);
  GlobalKey<FormState> keke = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 78, 68),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),
              Text(
                "Converter",
                style: TextStyle(
                  color: const Color.fromARGB(255, 244, 252, 247),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 900,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 252, 247),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "أدخل المبلغ بالعملة القديمة",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 78, 68),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: keke,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'أدخل الرقم';
                          if (int.tryParse(value) == null)
                            return 'الرجاء إدخال رقم صحيح';
                          if (value.contains(',') ||
                              value.contains('.') ||
                              value.contains('،'))
                            return 'الرجاء إدخال رقم صحيح';
                          if (value.length < 4) return 'الحد الأدنى هو 4 خانات';
                          if (value.length > 10)
                            return 'الله يرزقك هيك مبلغ عنجد 🙂 ';
                          if (int.tryParse(value)! < 3500)
                            return 'أقل مبلغ ممكن هو 3500';
                        },
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 78, 68),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "رقم موجب بدون فواصل",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          labelText: "المبلغ",
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 78, 68),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 78, 68),
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 78, 68),
                              width: 3,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 255, 0, 0),
                              width: 3,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 255, 0, 0),
                              width: 3,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (data) {
                          if (data == "") data = "0";
                          if (data.contains(',') ||
                              data.contains('.') ||
                              data.contains('،'))
                            data = "0";
                          if (data.runtimeType == String) {
                            int? money = int.parse(data);
                            money = money ~/ 100;
                            setState(() {
                              input.zeros();
                              keke.currentState!.validate();
                              input.getMonyMap(money!);
                              input.amount = money;
                            });
                          } else {}
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "المبلغ بالعملة الجديدة ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 78, 68),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "${input.amount}",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 1, 189, 117),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "القطع النقدية المكافئة",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 78, 68),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    //------------------500------------------------------------
                    input.moneymap["500"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 232, 188),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["500"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            92,
                                            52,
                                            7,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      //  width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/500.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                input.convert(500);
                              });
                            },
                          )
                        : SizedBox(),
                    //------------------200------------------------------------
                    input.moneymap["200"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 177, 238, 172),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["200"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            52,
                                            90,
                                            43,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/200.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                input.convert(200);
                              });
                            },
                          )
                        : SizedBox(),
                    //------------------100------------------------------------
                    input.moneymap["100"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 232, 182, 245),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["100"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            99,
                                            47,
                                            109,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/100.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                input.convert(100);
                              });
                            },
                          )
                        : SizedBox(),
                    //------------------50------------------------------------
                    input.moneymap["50"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 250, 203, 160),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["50"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            104,
                                            61,
                                            36,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/50.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                input.convert(50);
                              });
                            },
                          )
                        : SizedBox(),
                    //------------------25------------------------------------
                    input.moneymap["25"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 136, 180, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["25"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            33,
                                            45,
                                            117,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/25.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                input.convert(25);
                              });
                            },
                          )
                        : SizedBox(),
                    //------------------10------------------------------------
                    input.moneymap["10"]! > 0
                        ? GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 248, 170, 196),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        "x${input.moneymap["10"]}",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            102,
                                            22,
                                            46,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2, child: SizedBox(width: 50)),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(5),
                                        child: Image.asset(
                                          'images/10.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          )
                        : SizedBox(),
                    input.amount > 40
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(33, 0, 78, 68),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "في حال كنت لا تملك أحد الفئات النقدية اضغط عليها لاصرفها لك ضمن فئات اخرى",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 78, 68),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
