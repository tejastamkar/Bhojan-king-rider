import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderNo, item;
  final String date, time, type, msg;
  final bool showtype, confimed;
  final List food;

  const OrderDetailsScreen(
      {Key? key,
      required this.orderNo,
      required this.item,
      required this.date,
      required this.time,
      required this.type,
      required this.showtype,
      required this.food,
      required this.msg,
      required this.confimed})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  num price = 0, addon = 00, discount = 00, tax = 20, df = 30;
  String name = "Ashek Elahe",
      image =
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      address = "670 rood, bldg-2,room-14, thane , Mumbai";
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;
  @override
  void initState() {
    for (int i = 0; i < widget.food.length; i++) {
      widget.food[i]["quantity"] != 0
          ? price += widget.food[i]["price"] * widget.food[i]["quantity"]
          : price += widget.food[i]["price"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    Widget menuList({required int index}) => Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  widget.food[index]["image"],
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food[index]["name"],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${widget.food[index]["price"]}.00",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      "Ouantity: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget.food[index]["quantity"]}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      widget.food[index]["V/N"] ? "Veg" : "Non-Veg",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )
          ],
        );

    Widget orderBill() => Column(
          children: [
            Row(
              children: [
                const Text("Item Price",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text(
                  "₹$price",
                ),
              ],
            ),
            Row(
              children: [
                const Text("Addons",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$addon",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black38,
            ),
            Row(
              children: [
                const Text("Subtotal",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹${price + addon}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Discount",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$discount",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Tax",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$tax",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const Text("Delivery Fee",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Spacer(),
                Text("₹$df",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black38,
            ),
            Row(
              children: [
                Text("Total Amount",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor)),
                const Spacer(),
                Text("₹${price + addon + df + tax + discount}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor)),
              ],
            ),
          ],
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Order ID: #${widget.orderNo}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.date} , ${widget.time}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                height: 2,
                color: Colors.black38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: const [
                    Text(
                      "Delivery Km:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "7.6 km",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: const [
                    Text(
                      "Delivery Time :",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "30 Mins",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: const [
                    Text(
                      "Delivery Pay:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "₹ 80",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                height: 2,
                color: Colors.black38,
              ),
              Row(
                children: [
                  const Text(
                    "Item: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${widget.item}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  widget.showtype
                      ? Text(
                          "Delivred at ${widget.date} , ${widget.time}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                height: 2,
                color: Colors.black38,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.food.length,
                  itemBuilder: (context, index) => menuList(index: index)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                height: 2,
                color: Colors.black38,
              ),
              const Text(
                "Customer Details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        address,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              orderBill()
            ],
          ),
        ),
      ),
    );
  }
}
