import 'package:doctor_appointment_app/screens/appoinment_page.dart';
import 'package:doctor_appointment_app/screens/home_page.dart';
import 'package:flutter/material.dart';
class MainLayOut extends StatefulWidget {
  const MainLayOut({super.key});

  @override
  State<MainLayOut> createState() => _MainLayOutState();
}

class _MainLayOutState extends State<MainLayOut> {
  // variable decoration
  int currentPage = 0;
  final PageController  _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value){
          // update page index when tab pressed/switch page 
          setState(() {
            currentPage = value;
          });
        }),
        children: const <Widget> [
          HomePage(),
          AppoinmentPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          setState(() {
            currentPage = page;
            _page.animateToPage(
              page, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.easeInOut,
              );
          });
        },
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Apointments',
          ),
        ],
        
      ),
      
    );
  }
}