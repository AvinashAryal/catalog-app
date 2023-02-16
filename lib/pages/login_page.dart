import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name!",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter Username",
                  ),
                  onChanged: (value) => {name = value, setState(() {})},
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter Username",
                  ),
                  //obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(milliseconds: 500));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                    await Future.delayed(Duration(milliseconds: 100));
                    setState(() {
                      changeButton = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: changeButton ? 50 : 100,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: changeButton ? Colors.deepPurple : Colors.purple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 16),
                    ),
                    child: changeButton
                        ? Icon(Icons.done, color: Colors.blue)
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
                //   ElevatedButton(
                //     child: Text("Login"),
                //     style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
                //     onPressed: () {
                //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                //     },
                //   )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
