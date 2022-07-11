import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/screen%20/passwordscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<String> items = [
    'Bike',
    'Cycle',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: Image.asset(
                        "image/logo-1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text(
                    "REGISTER WITH US",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "only for Restaurant Partner",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "First name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Last name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mobile No",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email ID",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Vehical Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'select Vehical',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),

                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      // buttonHeight: 40,
                      // buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Driving Licence Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Driving Licence Expire Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width - 100,
                        height: 60,
                        child: DateTimePicker(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          initialValue: '',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date',
                          onChanged: (val) => log(val),
                          validator: (val) {
                            log(val!);
                            return null;
                          },
                          onSaved: (val) => log(val!),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPrimary: Colors.white,
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PasswordScreen()));
                    },
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
