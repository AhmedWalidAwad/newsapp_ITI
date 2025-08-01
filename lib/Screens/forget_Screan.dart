import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/register_screan.dart';

class ForgetScrean extends StatefulWidget {
  const ForgetScrean({super.key});

  @override
  State<ForgetScrean> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ForgetScrean> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text("Find Your Password")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Icons.email),
                hintText: 'exampel@gmail.com',
                errorText: _error,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
