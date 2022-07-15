import 'package:flutter/material.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  List assetsData = [
    {"name": "Caps", "Image": "image/Caps.png"},
    {"name": "Deilvery Bags", "Image": "image/Deilvery Bags.png"},
    {"name": "ID Cards", "Image": "image/ID Cards.png"},
    {"name": "T-shirts", "Image": "image/T-shirts.png"},
    {"name": "Umbrella", "Image": "image/Umbrella.png"},
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          "Assets Panel",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        foregroundColor: Colors.black,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: assetsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width < 440 ? 2 : 3),
        itemBuilder: (contect, index) => Column(
          children: [
            Image.asset(assetsData[index]["Image"]),
            const SizedBox(
              height: 4,
            ),
            Text(
              assetsData[index]["name"],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
