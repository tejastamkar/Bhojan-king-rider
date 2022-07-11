import 'package:flutter/material.dart';
import 'package:riderapp/data/orderdata.dart';
import 'package:riderapp/screen%20/orderdetails.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List select = ["All", "Today", "Week", "Month"];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget orderCard({
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
                Container(
                  width: width,
                  height: 2,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order History",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_left_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => setState(() {
                        if (index != 0) {
                          index--;
                        }
                      }),
                    ),
                    const Spacer(),
                    Text(
                      select[index],
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => setState(() {
                        if (index != 3) {
                          index++;
                        }
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (index == 0)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: deliveredOrderData.length,
                    itemBuilder: (context, index) => orderCard(
                          orderNo: deliveredOrderData[index]['orderId'],
                          date: deliveredOrderData[index]['date'],
                          time: deliveredOrderData[index]['time'],
                          name: deliveredOrderData,
                        ))
              else if (index == 1)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: todayList.length,
                    itemBuilder: (context, index) => orderCard(
                          orderNo: todayList[index]['orderId'],
                          date: todayList[index]['date'],
                          time: todayList[index]['time'],
                          name: todayList,
                        ))
              else if (index == 2)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: weekly.length,
                    itemBuilder: (context, index) => orderCard(
                          orderNo: weekly[index]['orderId'],
                          date: weekly[index]['date'],
                          time: weekly[index]['time'],
                          name: weekly,
                        ))
              else
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monthly.length,
                    itemBuilder: (context, index) => orderCard(
                          orderNo: monthly[index]['orderId'],
                          date: monthly[index]['date'],
                          time: monthly[index]['time'],
                          name: monthly,
                        ))
            ],
          )),
    );
  }
}
