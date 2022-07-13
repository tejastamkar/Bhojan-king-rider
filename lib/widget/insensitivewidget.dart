import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/data/orderdata.dart';

class InsensitiveWidget extends StatefulWidget {
  const InsensitiveWidget({Key? key}) : super(key: key);

  @override
  State<InsensitiveWidget> createState() => _InsensitiveWidgetState();
}

class _InsensitiveWidgetState extends State<InsensitiveWidget>
    with TickerProviderStateMixin {
  int selected = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selected = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = _tabController;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget orderDetailCard(
            {required String name,
            required int orderNo,
            required int earning,
            required int time,
            required String image,
            required double distance}) =>
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(image),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Order ID: #$orderNo",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            "Earing",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "₹ $earning",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    height: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Time: $time mins",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      Container(width: 2, height: 20, color: Colors.grey),
                      const Spacer(),
                      Text(
                        "Distance: $distance Km",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: SizedBox(
              width: width,
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).primaryColor),
                unselectedLabelColor: Colors.black,
                controller: tabController,
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                tabs: [
                  Row(
                    children: [
                      const Tab(
                        child: Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(width: selected != 0 ? 10 : 0),
                      selected != 0 && selected != 1
                          ? Container(
                              width: 2,
                              height: 20,
                              color: Colors.grey.shade300,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Row(
                    children: [
                      const Tab(
                        child: Text(
                          "Weekly",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(width: selected != 1 ? 10 : 0),
                      selected != 1
                          ? Container(
                              width: 2,
                              height: 20,
                              color: Colors.grey.shade300,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const Tab(
                    child: Text(
                      "Monthly",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: height - 300,
          child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todayOrderList.length,
                      itemBuilder: (context, index) => orderDetailCard(
                          name: todayOrderList[index]["name"],
                          orderNo: todayOrderList[index]["orderNo"],
                          earning: todayOrderList[index]["amount"],
                          time: todayOrderList[index]["time"],
                          image: todayOrderList[index]["image"],
                          distance: todayOrderList[index]["distance"])),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: weeklyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List data = weeklyList[index]["data"];
                      return ExpandablePanel(
                          header: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              weeklyList[index]["date"],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          collapsed: const SizedBox(),
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                            // expandIcon: Icons.keyboard_arrow_right,
                          ),
                          expanded: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return orderDetailCard(
                                    name: data[index]["name"],
                                    orderNo: data[index]["orderNo"],
                                    earning: data[index]["amount"],
                                    time: data[index]["time"],
                                    image: data[index]["image"],
                                    distance: data[index]["distance"]);
                              }),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: expanded,
                                ),
                                theme: const ExpandableThemeData(
                                    crossFadePoint: 0),
                              ),
                            );
                          });
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: monthlyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List data = monthlyList[index]["data"];
                      return ExpandablePanel(
                          header: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              monthlyList[index]["month"],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          collapsed: const SizedBox(),
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                            // expandIcon: Icons.keyboard_arrow_right,
                          ),
                          expanded: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return orderDetailCard(
                                    name: data[index]["name"],
                                    orderNo: data[index]["orderNo"],
                                    earning: data[index]["amount"],
                                    time: data[index]["time"],
                                    image: data[index]["image"],
                                    distance: data[index]["distance"]);
                              }),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: expanded,
                                ),
                                theme: const ExpandableThemeData(
                                    crossFadePoint: 0),
                              ),
                            );
                          });
                    }),
              ]),
        )
      ],
    );
  }
}
