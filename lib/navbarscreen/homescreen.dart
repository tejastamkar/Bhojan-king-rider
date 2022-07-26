import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:riderapp/data/orderdata.dart';
import 'package:riderapp/screen%20/orderdetails.dart';
import 'package:riderapp/widget/neworderwidget.dart';

bool isSwitched = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool checkactive = activeOrder;
    double width = MediaQuery.of(context).size.width;
    Widget orderCard({
      required int index,
      required var name,
      required int orderNo,
      required String date,
      required String time,
    }) =>
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(
                        orderNo: name[index]["orderId"],
                        item: name[index]["item"],
                        date: name[index]["date"],
                        time: name[index]["time"],
                        type: "",
                        showtype: true,
                        food: name[index]["food"],
                        confimed: false,
                        msg: 'Cooking',
                      ))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order ID: #$orderNo",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "$date , $time",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 15,
                                width: 1.5,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                "Delivery",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    return Scaffold(
      appBar: AppBar(
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
        title: Image.asset("image/logo-1.png"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 40),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Todays",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                maxLines: 1,
                                textScaleFactor: 1,
                                text: TextSpan(
                                  text: 'Daily Target :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.grey.shade700),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: ' 10',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                maxLines: 1,
                                textScaleFactor: 1,
                                text: TextSpan(
                                  text: 'Delivered :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.grey.shade700),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: ' 08',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                maxLines: 1,
                                textScaleFactor: 1,
                                text: TextSpan(
                                  text: 'Earning :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.grey.shade700),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: ' ₹645',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.black)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Weekly",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    maxLines: 1,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Delivered :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' 89',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    maxLines: 1,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Earning :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' ₹6,645',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Monthly",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    maxLines: 1,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Delivered :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' 390',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    maxLines: 1,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Earning :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' ₹25,645',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                checkactive ? "Active Order" : "New Orders",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: NewOrderWidget(),
              ),
              const Text(
                "Delivered Orders",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todayList.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              index != 0
                                  ? Container(
                                      width: width,
                                      height: 2,
                                      color: Colors.grey.shade400,
                                    )
                                  : const SizedBox(),
                              orderCard(
                                index: index,
                                orderNo: todayList[index]['orderId'],
                                date: todayList[index]['date'],
                                time: todayList[index]['time'],
                                name: todayList,
                              ),
                            ],
                          )))
            ],
          )),
    );
  }
}
