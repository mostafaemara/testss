import 'package:flutter/material.dart';
import 'package:untitled12/register_screen.dart';
import 'package:untitled12/table_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final patientController = new TextEditingController();
  final doctorController = new TextEditingController();
  var formkey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 10.0,
                    top: 7,
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/work.png'),
                  height: 175,
                  width: 175,
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    controller: patientController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'patient',
                      prefixIcon: Icon(
                        Icons.local_hospital,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "enter correct patient name";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: doctorController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'doctor',
                      prefixIcon: Icon(
                        Icons.local_hospital_rounded,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "enter correct Doctor name";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        var patient = patientController.text;
                        print(patientController);
                        var doctor = doctorController.text;
                        print(doctorController);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => table_screen(
                                patient: patient,
                                doctor: doctor,
                              ),
                            ));
                      }
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'First measurment ?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register_screen()));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
