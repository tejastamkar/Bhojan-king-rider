import 'package:flutter/material.dart';
import 'package:riderapp/navbarscreen/navbarscreen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: Image.asset(
                        "image/logo-1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text(
                    "REGISTER WITH US",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "only for Restaurant Partner",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
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
                            isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Card(
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
                            isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPrimary: Colors.white,
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavbarScreen()));
                    },
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
