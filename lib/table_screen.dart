import 'package:flutter/material.dart';
import 'package:untitled12/login_screen.dart';

class table_screen extends StatelessWidget {
  final String patient;
  final String doctor;
  table_screen({
    required this.patient,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Center(
          child: Text(
            'Ultrasound Bone Desitometer Unit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: (Text(
                'Measurment',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                  defaultColumnWidth: FixedColumnWidth(180.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text('patient',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text('$patient', style: TextStyle(fontSize: 20.0))
                        ]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            'doctor',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            '$doctor',
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            '        last          measurment',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            '-2.3',
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            '        new          measurment',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Text(
                            '-1.3',
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                      ),
                    ]),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '"You should visit your doctor"',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
              child: Image(
                image: AssetImage('assets/images/work.png'),
                height: 200,
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 15),
              child: Container(
                width: 150,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
