import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCart extends StatelessWidget {
  const DoctorCart({Key?key, required this.route}): super(key: key);

  final String route;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child:  Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child:  Image.asset('assets/doctor2.jpg',fit: BoxFit.fill,),
              ),
              const Flexible(child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      'Dr Khoi Nguyen',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Icon(Icons.star_border,color: Colors.yellow, size: 16,),
                        Spacer(flex: 1,),
                        Text('4.5'),
                        Spacer(flex: 1,),
                        Text('reviews'),
                        Spacer(flex: 1,),
                        Text('(20)'),
                        Spacer(flex: 7,),
                      ],
                    )
                  ],
                ),
                ),
              )
            ],
          ),
        ),
        //redirect to doctor details page
        onTap: (){
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}