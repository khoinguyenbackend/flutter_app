import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppoimentCart extends StatefulWidget {
  const AppoimentCart({super.key});

  @override
  State<AppoimentCart> createState() => _AppoimentCartState();
}

class _AppoimentCartState extends State<AppoimentCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor1.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr richard Tan',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 2),
                      Text(
                        'Dental',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const Schedulecard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Comleted',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Schedulecard extends StatelessWidget {
  const Schedulecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, color: Config.primaryColor, size: 15),
          SizedBox(
            width: 5,
          ),
          Text(
            'Monday, 03/7/2024',
            style: TextStyle(color: Config.primaryColor),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.access_alarm, color: Config.primaryColor, size: 17),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2:00 Pm',
            style: TextStyle(color: Config.primaryColor),
          ))
        ],
      ),
    );
  }
}
