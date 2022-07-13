import 'package:flutter/material.dart';
import 'package:riderapp/data/userdata.dart';

class BankInfoScreen extends StatefulWidget {
  const BankInfoScreen({Key? key}) : super(key: key);

  @override
  State<BankInfoScreen> createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends State<BankInfoScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    BankInfo() => showModalBottomSheet(
        builder: (context) => SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bank Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(),
                  ),
                )
              ],
            )),
        context: context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          "Bank info",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
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
                text: 'Bank Name: ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey.shade700),
                children: <TextSpan>[
                  TextSpan(
                      text: bankName,
                      style: const TextStyle(
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
                text: 'Branch Name: ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey.shade700),
                children: <TextSpan>[
                  TextSpan(
                      text: branchName,
                      style: const TextStyle(
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
                text: 'Holder Name: ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey.shade700),
                children: <TextSpan>[
                  TextSpan(
                      text: holderName,
                      style: const TextStyle(
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
                text: 'Account No: ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey.shade700),
                children: <TextSpan>[
                  TextSpan(
                      text: "$bankAccNo",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: width / 4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    onPrimary: Colors.white,
                    primary: Theme.of(context).primaryColor),
                onPressed: (() => BankInfo()),
                child: const Text(
                  "Edit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
