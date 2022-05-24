import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/business_logic/cubits/available_hours_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/stt_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_date_cubit.dart';
import 'package:hospital_guider/src/business_logic/cubits/selected_time.cubit.dart';
import 'package:hospital_guider/src/views/screens/avaliable_hours_screen.dart';
import 'package:hospital_guider/src/views/screens/payment_screen.dart';
import 'package:hospital_guider/src/views/utils/styles/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const homeScreenRoute = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        2022,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(
        2023,
      ),
    );

    if (pickedDate != null) {
      BlocProvider.of<SelectedDateCubit>(context).selectDate(
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}');
    }
  }

  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _numberIdentificationController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _numberIdentificationController = TextEditingController();
    _emailController = TextEditingController();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _numberIdentificationController.dispose();
    _emailController.dispose();
    _locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Style.backgroundColor),
      appBar: AppBar(
        title: const Text('Đăng ký khám bệnh online'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 9, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35.0,
                ),
                const RegisterStepRichText(
                  step: 'Bước 1: ',
                  title: 'Đăng ký ngày giờ khám bệnh',
                ),
                const SizedBox(
                  height: 35.0,
                ),
                DatePickerButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  title: 'Chọn ngày',
                  buttonKey: const ValueKey('select_date'),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                BlocBuilder<SelectedDateCubit, String>(
                  builder: (context, selectedDate) {
                    return Center(
                      child: SelectedDateRichText(
                        title: 'Ngày được chọn: ',
                        selectedDate: selectedDate,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                DatePickerButton(
                  onPressed: () {
                    BlocProvider.of<AvailableHoursCubit>(context, listen: false)
                        .getAvailableRegisterHours();

                    Navigator.pushNamed(context,
                        AvailableHoursScreen.availableHoursScreenRoute);
                  },
                  title: 'Chọn giờ',
                  buttonKey: const ValueKey('select_hour'),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                BlocBuilder<SelectedTimeCubit, String>(
                  builder: (context, selectedTime) {
                    return Center(
                      child: SelectedDateRichText(
                        title: 'Giờ được chọn: ',
                        selectedDate: selectedTime,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                const RegisterStepRichText(
                  step: 'Bước 2: ',
                  title: 'Nhập thông tin',
                ),
                const SizedBox(
                  height: 35.0,
                ),
                InfoFormWidget(
                  labelText: 'Họ và tên',
                  icon: Icons.person,
                  controller: _nameController,
                ),
                InfoFormWidget(
                  labelText: 'Số điện thoại',
                  icon: Icons.phone_iphone,
                  controller: _phoneNumberController,
                ),
                InfoFormWidget(
                  labelText: 'Số cắn cước công dân',
                  icon: Icons.card_membership,
                  controller: _numberIdentificationController,
                ),
                InfoFormWidget(
                  labelText: 'Email',
                  icon: Icons.email,
                  controller: _emailController,
                ),
                InfoFormWidget(
                  labelText: 'Địa chỉ nhà',
                  icon: Icons.location_city_outlined,
                  controller: _locationController,
                ),
                const SizedBox(
                  height: 35.0,
                ),
                const RegisterStepRichText(
                  step: 'Bước 3: ',
                  title: 'Thanh toán',
                ),
                const SizedBox(
                  height: 35.0,
                ),
                DatePickerButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                       BlocProvider.of<STTCubit>(context).generateNo();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentScreen(
                              nameController: _nameController,
                              phoneNumberController: _phoneNumberController,
                              numberIdentificationController:
                                  _numberIdentificationController,
                              emailController: _emailController,
                              locationController: _locationController),
                        ),
                      );
                    }
                  },
                  title: 'Tiến hành thanh toán',
                  buttonKey: const ValueKey('payment'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedDateRichText extends StatelessWidget {
  const SelectedDateRichText(
      {Key? key, required this.title, required this.selectedDate})
      : super(key: key);
  final String title;
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: const TextStyle(color: Colors.black, fontSize: 19.0)),
        TextSpan(
            text: selectedDate,
            style: const TextStyle(fontSize: 25.0, color: Colors.blue))
      ]),
    );
  }
}

class InfoFormWidget extends StatelessWidget {
  const InfoFormWidget({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.controller,
  }) : super(key: key);
  final String labelText;
  final IconData? icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Làm ơn điền thông tin ở mục này';
          }
          return null;
        },
      ),
    );
  }
}

class RegisterStepRichText extends StatelessWidget {
  const RegisterStepRichText({
    Key? key,
    required this.step,
    required this.title,
  }) : super(key: key);
  final String step;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: step,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 19,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class DatePickerButton extends StatelessWidget {
  const DatePickerButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.buttonKey})
      : super(key: key);
  final Function()? onPressed;
  final String title;
  final Key buttonKey;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(elevation: MaterialStateProperty.all(11)),
        key: buttonKey,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }
}
