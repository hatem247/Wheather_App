import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Screens/LoginPage.dart';
import 'package:provider/provider.dart';

import '../Providers/UserProvider.dart';
import '../Widgets/CustomTextField.dart';

class SignupPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"), centerTitle: true),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: "Name",
                  icon: Icon(Icons.person),
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Name Can't be null";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  label: "Phone",
                  icon: Icon(Icons.phone),
                  controller: phone,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Phone Can't be null";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  label: "Email",
                  icon: Icon(Icons.mail),
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Email Can't be null";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  label: "Password",
                  icon: Icon(Icons.password),
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Password Can't be null";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.signup(
                          name: name.text,
                          phone: phone.text,
                          email: email.text,
                          password: password.text,
                        );
                        if (provider.user!.status) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Loginpage()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(provider.user!.message)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(provider.user!.message)),
                          );
                        }
                      }
                    },
                    child: Text("Signup"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
