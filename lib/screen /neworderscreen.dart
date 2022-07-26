import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:riderapp/widget/neworderwidget.dart';
// import 'package:riderapp/data/orderdata.dart';

import '../navbarscreen/homescreen.dart';

class NewOrderScreen extends StatefulWidget {
  final String orderNumber;
  const NewOrderScreen({Key? key, required this.orderNumber}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.close)),
        actions: [
          FlutterSwitch(
            width: 100,
            showOnOff: true,
            activeColor: Theme.of(context).primaryColor,
            activeTextColor: Colors.white,
            inactiveTextColor: Colors.black,
            value: isSwitched,
            onToggle: (val) {
              setState(() {
                isSwitched = val;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "New Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  "ID: #${widget.orderNumber}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/logo-restro.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Domino's",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Time :",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "12 mins",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "Distance :",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "3.4km",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "SHOP NO. 6, GOREGAON MALAD LINK ROAD,JAGDAMBA COMMERCIAL COMPLEX,NEXT TO MOVIE TIME CINEMA,MALAD(W),MUMBAI - 400064 ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery To ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/logo-restro.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Rohan Singh",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Time :",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "30 mins",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "Distance :",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "8.4km",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "SHOP NO. 6, GOREGAON MALAD LINK ROAD,JAGDAMBA COMMERCIAL COMPLEX,NEXT TO MOVIE TIME CINEMA,MALAD(W),MUMBAI - 400064 ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Payment :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "Paid",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Veg wrap X1",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "₹190",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Veg bowl X1",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "₹230",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Delivery Charges",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "₹70",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Taxes",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "₹30",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: width,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Total Bill",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "₹470",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  primary: Colors.red,
                  onPrimary: Colors.white),
              onPressed: () => {
                    setState(() {
                      activeOrder = false;
                    }),
                    Navigator.pop(context)
                  },
              child: const Text("Pass On")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  primary: Colors.green,
                  onPrimary: Colors.white),
              onPressed: () {
                setState(() {
                  activeOrder = true;
                });
                Navigator.pop(context);
              },
              child: const Text("Accecpt")),
        ],
      ),
    );
  }
}
