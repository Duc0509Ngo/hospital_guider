import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/business_logic/cubits/available_hours_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_time.cubit.dart';
import 'package:hospital_guider/src/views/utils/styles/constants.dart';

class AvailableHoursScreen extends StatelessWidget {
  const AvailableHoursScreen({Key? key}) : super(key: key);
  static const availableHoursScreenRoute = '/available_hours';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Style.backgroundColor),
      appBar: AppBar(
        title: const Text('Giờ có thể đăng ký khám'),
      ),
      body: BlocBuilder<AvailableHoursCubit, List<List>>(
        builder: (context, hours) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(9, 9, 9, 0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: hours.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  key: ValueKey('time-$index'),
                  onTap: () {
                    BlocProvider.of<SelectedTimeCubit>(context)
                        .selectDate(hours[index][0]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      hours[index][0],
                      style: const TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
