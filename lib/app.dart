import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/business_logic/cubits/available_hours_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/stt_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_date_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_time.cubit.dart';
import 'package:hospital_guider/src/data/repositories/repository.dart';
import 'package:hospital_guider/src/views/routes/router.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AvailableHoursCubit(Repository()),
        ),
        BlocProvider(
          create: (context) => SelectedDateCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedTimeCubit(),
        ),
        BlocProvider(
          create: (context) => STTCubit(Repository()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        onGenerateRoute: RouterNavigation.generateRoute,
      ),
    );
  }
}
