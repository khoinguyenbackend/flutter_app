import 'package:doctor_appointment_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( // Bọc widget bạn muốn mở rộng với thuộc tính flex
              flex: 3, // Đặt giá trị flex
              child: Lottie.asset('assets/Animation - 1710085759012.json'),
            ),
            Container(
              width:  double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Seccessfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Button(
                width: double.infinity, 
                title: 'Back to Home page', 
                onPressed: ()=> Navigator.of(context).pushNamed('main'), 
                disable: false
              ),
            )
          ],
        ),
      ),
    );
  }
}