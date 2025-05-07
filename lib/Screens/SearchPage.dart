import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Providers/WheatherProvider.dart';
import 'package:holistic_2_wheather_app/Screens/WheatherPage.dart';
import 'package:holistic_2_wheather_app/Widgets/CustomTextField.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  TextEditingController search = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Wheather"), centerTitle: true),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                label: "Search",
                icon: Icon(Icons.search),
                controller: search,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "City name can't be null";
                  }
                  return null;
                },
                obscureText: false,
              ),
            ),
            ElevatedButton(
              onPressed: () {
               if(formKey.currentState!.validate()){
                 Provider.of<WheatherProvider>(context, listen: false).wheather = null;
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => WheatherPage(city: search.text),
                   ),
                 );
               }
              },
              child: Text("Get Wheather"),
            ),
          ],
        ),
      ),
    );
  }
}
