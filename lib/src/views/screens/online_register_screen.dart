import 'package:flutter/material.dart';
import 'package:hospital_guider/src/views/utils/styles/constants.dart';


class OnlineRegisterScreen extends StatelessWidget {
  const OnlineRegisterScreen({Key? key}) : super(key: key);
  static const String onlineRegisterScreenRoute = '/online_register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Style.backgroundColor),
      appBar: AppBar(
        title: const Text('Đăng ký khám bệnh online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Bước 1:    ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    TextSpan(
                        text: 'Lấy số thứ tự',
                        style: TextStyle(fontSize: 19.0, color: Colors.black)),
                  ])),
                 
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(
                  Icons.print,
                  size: 55.0,
                ),
              ),
              const SizedBox(
                height: 55.0,
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Chưa có số thứ tự',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
