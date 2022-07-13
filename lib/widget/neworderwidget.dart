import 'package:flutter/material.dart';

class NewOrderWidget extends StatelessWidget {
  const NewOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/logo-restro.png"),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Domino's",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Text("Order ID: #100070",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Pick up",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                  "25 mins",
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
                  "7.6km",
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
              height: 10,
            ),
            const Text(
              "Drop",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                  "25 mins",
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
                  "7.6km",
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
            Center(
              child: TextButton(
                child: Text(
                  "View More",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
