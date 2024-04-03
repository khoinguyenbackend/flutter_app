import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/components/custom_appbar.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  // for favourite button
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(
        appTitle: 'Doctor Detail',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isFav = !isFav;
              });
            }, 
            icon: FaIcon(
              isFav? Icons.favorite_rounded: Icons.favorite_outline,
              color: Colors.red,
            )
          ),
        ],
      ),

      body:  SingleChildScrollView(
        child:  SafeArea(
          child: Column(
            children: <Widget>[
              const AboutDoctor(),
              const DetailBody(),
              // Spacer(),
              Padding(
                padding:const EdgeInsets.all(20),
                child: Button(
                    width: double.infinity, 
                    title: 'Book Appointment', 
                    onPressed: (){
                      // navigate to booking page 
                      Navigator.of(context).pushNamed('booking_page');
                    }, 
                    disable: false),                              
                  )
            ],
          ) 
        ),
      ),
    );
  }
}


class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return  Container(
      width: double.infinity,
      child:  Column(
        children:<Widget> [
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor2.jpg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr Khôi Nguyên',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Bác sĩ Khôi Nguyên là một chuyên gia trong lĩnh vực nha khoa, tốt nghiệp chuyên ngành Dental tại Đại học Y Khoa Hà Nội.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Bệnh viện Đại học y dược tp.HCM',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}


class DetailBody extends StatelessWidget {
  const DetailBody({Key?key}): super(key: key);

  @override
Widget build(BuildContext context) {
  Config().init(context);
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceSmall,
          Text(
            'About Doctor',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Config.spaceSmall,
          Text(
            'DR Khoi Nguyen is an experienced dentist in Ho Chi Minh City.He graduated in 2008 and completed his training at Ho Chi Minh City University of Medicine and Pharmacy ',
            style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black, fontWeight: FontWeight.w300),
            textAlign: TextAlign.justify,
            softWrap: true,
          ),
        ],
      ),
    ),
  );
}
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return const Row(
      children: <Widget>[
        InfoCard(label: 'Patients', values: '109'),
        SizedBox(height: 15,),
        InfoCard(label: 'Experients', values: '10 năm'),
        SizedBox(height: 15,),
        InfoCard(label: 'Rating', values: '4.6'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key?key, required this.label,required this.values}):super(key: key);
  
  final String label;
  final String values;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Config.primaryColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child:  Column(
            children:  <Widget>[
              Text(
                label,style: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10,),
              Text(
                values,style:const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w800),
              ),
            ],
          ),
        )
      );
  }
}