import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/business_logic/cubits/stt_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_date_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_time.cubit.dart';
import 'package:hospital_guider/src/data/data_providers/hours_provider.dart';
import 'package:hospital_guider/src/data/data_providers/profile_user_provider.dart';
import 'package:hospital_guider/src/data/data_providers/stt_provider.dart';
import 'package:hospital_guider/src/views/utils/styles/constants.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen(
      {Key? key,
      required this.nameController,
      required this.phoneNumberController,
      required this.numberIdentificationController,
      required this.emailController,
      required this.locationController})
      : super(key: key);
  static const paymentScreenRoute = '/payment';
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController numberIdentificationController;
  final TextEditingController emailController;
  final TextEditingController locationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Style.backgroundColor),
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              const Text(
                'Xác nhận thông tin ngày giờ đặt lịch',
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Builder(builder: (context) {
                return RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Bạn sẽ khám vào lúc ',
                          style: TextStyle(fontSize: 19, color: Colors.black)),
                      TextSpan(
                          text:
                              '${context.select((SelectedTimeCubit cubit) => cubit.state)} - ${context.select((SelectedDateCubit cubit) => cubit.state)}',
                          style:
                              const TextStyle(fontSize: 19, color: Colors.blue))
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 25.0,
              ),
              Builder(
                builder: (context) {
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25.0,
                          ),
                          const Text(
                            'Số thứ tự',
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            '${context.select((STTCubit cubit) => cubit.state)}',
                            style: const TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Số tiền cần thanh toán là 200 ngàn',
                style: TextStyle(
                  fontSize: 21.0,
                ),
              ),
              const SizedBox(
                height: 55.0,
              ),
              BlocBuilder<SelectedTimeCubit, String>(
                builder: (context, time) {
                  return ElevatedButton(
                    onPressed: () async {
                      await UserProvider().addUser(
                          nameController.text,
                          phoneNumberController.text,
                          numberIdentificationController.text,
                          emailController.text,
                          locationController.text,
                          '$time - ${BlocProvider.of<SelectedDateCubit>(context).state}');
                      await AvailableHoursProvider().deleteSelectedTime(time);
                      await STTProvider().updateSTT(
                        BlocProvider.of<STTCubit>(context).state,
                      );
                      BlocProvider.of<SelectedDateCubit>(context)
                          .selectDate('');
                      BlocProvider.of<SelectedTimeCubit>(context)
                          .selectDate('');
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(19.0),
                      child: Text(
                        'Thanh toán',
                        style: TextStyle(
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
