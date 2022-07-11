import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                onPrimary: Colors.white,
                primary: Theme.of(context).primaryColor),
            onPressed: () {},
            child: const Text(
              "Update",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Old Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => setState(() {
                          isPassword = !isPassword;
                        }),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "New Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => setState(() {
                          isPassword = !isPassword;
                        }),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Confirm Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => setState(() {
                          isPassword = !isPassword;
                        }),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
