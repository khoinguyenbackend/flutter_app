import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/screens/booking_page.dart';
import 'package:doctor_appointment_app/screens/doctor_details.dart';
import 'package:doctor_appointment_app/screens/main_layout.dart';
import 'package:doctor_appointment_app/screens/success_booked.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //define themeData here
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Doctor App',
      theme: ThemeData(
        //pre-define input decaration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        // This is initial route of this app
        // which is auth page (login and sign up)
        '/' :(context)=> const AuthPage(),
        //this is for main layout after login 
        'main': (context) => const MainLayOut(),
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) =>  const AppointmentBooked(),
      },
    );
  }
}
// now let build login component
// and page view