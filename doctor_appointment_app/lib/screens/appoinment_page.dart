import 'package:doctor_appointment_app/components/appoiment_card.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppoinmentPage extends StatefulWidget {
  const AppoinmentPage({Key?key}):super(key: key);

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

enum FilterStatus{upcoming,complete,cancel}

class _AppoinmentPageState extends State<AppoinmentPage> {
  // trạng thái mặc đingj là upcoming
  FilterStatus status = FilterStatus.upcoming;
  // chỉ đingj vị trí tương ứng theo trụ 'x' và 'y'
  Alignment _alignment = Alignment.centerLeft;
  // Khai báo danh sách schedule chứa lịch trình của bác sĩ.
  List<dynamic> schedule = [
    {
      "doctor_name":"Minh an",
      "doctor_profile":"assets/doctor2.jpg",
      "category":"Dental",
      "status":"upcoming",
    },
    {
      "doctor_name":"Khoi nguyen",
      "doctor_profile":"assets/doctor3.jpg",
      "category":"Cardiology",
      "status":"complete",
    },
    {
      "doctor_name":"Phat Ong",
      "doctor_profile":"assets/doctor4.jpg",
      "category":"Respiration",
      "status":"complete",
    },
    {
      "doctor_name":"Tri trung",
      "doctor_profile":"assets/doctor5.jpg",
      "category":"General",
      "status":"cancel",
    },
  ];
  @override
  Widget build(BuildContext context) {
    // Khai báo danh sách filteredStatus chứa phần tử lọc từ danh sách schedule
    List<dynamic> filteredSchedules = schedule.where((var schedule){
      switch (schedule['status']) {
        case 'upcoming':
          return status == FilterStatus.upcoming;
        case 'complete':
          return status == FilterStatus.complete;
        case 'cancel':
          return status == FilterStatus.cancel;
        default:
          return false;
      }
    }).toList();




    return  SafeArea(
      child: Padding(
        padding:  const EdgeInsets.only(left: 20,top: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [

            // appointment title
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,

            // stack là hiển thị widget theo kiểu chồng chéo lên nhau các phẩn tử được tạo sau cùng
            // sẽ chồng lên và che phủ các phẩn tử trước đó
            Stack(
              children: [
                // hiển thị toàn bộ trạng thái
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Lặp qua các vị trí có sẵn trong enum FilterStatus.
                      for(FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            // mỗi lần User thực hiện chạm vào widget Expanded thì vòng lặp sẽ chạy 1 lần và trả về giá trị tương ứng.
                            onTap: (){
                              setState(() {
                                // Trong khối setState, kiểm tra các giá trị của filterStatus và
                                // thay đổi trạng thái của status và _alignment tương ứng với giá trị
                                // của filterStatus. Ví dụ, nếu filterStatus là FilterStatus.upcoming,
                                // status sẽ được đặt thành FilterStatus.upcoming và _alignment sẽ được
                                // đặt thành Alignment.centerLeft. Tương tự, các trường hợp khác cũng được xử lý tương ứng.
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if(filterStatus == FilterStatus.complete) {
                                   status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                }else if(filterStatus == FilterStatus.cancel) {
                                   status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ), 
                        ),
                    ],
                  ),
                ),
                // Hiển thị trạng thái đang hoạt động
                AnimatedAlign(
                  alignment: _alignment, 
                  duration: const Duration(milliseconds: 150),
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context,index){
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement ? const EdgeInsets.only(bottom: 20):EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(backgroundImage: AssetImage(_schedule['doctor_profile']),),
                              const SizedBox(height: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_schedule['doctor_name'],style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 5,),
                                  Text(_schedule['category'],style: const TextStyle(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.normal),),
                                ],
                              ),
                              // const Schedulecard()
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Schedulecard(),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: OutlinedButton(
                                onPressed: (){},
                                child: const Text('Cancel',style: TextStyle(color: Config.primaryColor),),)
                              ),
                              const SizedBox(height: 20,),
                              Expanded(child: OutlinedButton(
                                onPressed: (){},
                                style: OutlinedButton.styleFrom(backgroundColor: Config.primaryColor),
                                child: const Text('Reschedule',style: TextStyle(color: Colors.white),),)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),  
            )
          ],
        ),
      )
    );
  }
}