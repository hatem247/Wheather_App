import 'package:flutter/material.dart';
import '../Providers/UserProvider.dart';
import '../Screens/SignupPage.dart';
import '../Widgets/CustomTextField.dart';
import 'package:provider/provider.dart';
import 'SearchPage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.login(
                          email: email.text,
                          password: password.text,
                        );
                        if (provider.user!.status) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage()),
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
                    child: Text("Login"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    "Don't have account? Sign up",
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
