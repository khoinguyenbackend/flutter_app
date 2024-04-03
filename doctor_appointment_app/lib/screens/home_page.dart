import 'package:doctor_appointment_app/components/appoiment_card.dart';
import 'package:doctor_appointment_app/components/doctor_cart.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
  {
    "icon": FontAwesomeIcons.userDoctor,
    "category": "General",
  },
  {
    "icon": FontAwesomeIcons.heartPulse,
    "category": "Cardiology",
  },
  {
    "icon": FontAwesomeIcons.lungs,
    "category": "Respirations",
  },
  {
    "icon": FontAwesomeIcons.personPregnant,
    "category": "Dermatology",
  },
  {
    "icon": FontAwesomeIcons.teeth,
    "category": "Gynecology",
  },
  {
    "icon": FontAwesomeIcons.user,
    "category": "Dental",
  },
];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return  Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      'Khoi nguyen',
                      style:  TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/khoinguyen.jpg') ,
                      ),
                    )
                  ],
                ),
                Config.spaceSmall,
                // category listing
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize *0.06,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length,(index){
                      return  Card(
                        margin: const  EdgeInsets.only(right:20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15,vertical:10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:<Widget> [
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                medCat[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
            
                            ],
                          ),
                        ),
                      );
                    }
                    ),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Apoiment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                // display appoiment card here 
                // let's create appoiment card widget
                const AppoimentCart(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                // List of top doctors
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index){
                    return const DoctorCart(
                      route: 'doc_details',
                    );
                  }),
                )
            
              ],
            ),
          )
        ),
      )
    );
  }
}