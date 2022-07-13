import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riderapp/widget/insensitivewidget.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("image/walleticon.svg"),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Todays Earning",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700),
                        ),
                        const Text(
                          "₹ 567",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Weekly",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700),
                        ),
                        const Text(
                          "₹ 9,037",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.grey,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Weekly",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700),
                        ),
                        const Text(
                          "₹ 9,037",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            "Insensitive Panel",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const InsensitiveWidget()
        ],
      ))),
    );
  }
}
