import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/another_page.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
String? myName;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myname");
    });
  }


  void remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.remove('myname');
    
  }

  // Declare your function to load data

  @override
   void initState() {
    loadData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
      ),
       body: Center(
         child: SingleChildScrollView(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Show Your name
                Text(myName ?? "รอสักครู่",style: TextStyle(fontSize: 25),),
                // Button to go to another page
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        remove();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blueAccent, // Background color
                        ),
                      child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Text(
                            'Back to first',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    
                     Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blueAccent, // Background color
                    ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Text(
                        'Back to Homepage', 
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                  ),
                ),
              ],
            ),
          ),
               ),
       ),
    );
  }
}
