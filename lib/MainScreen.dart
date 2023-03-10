import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController kgvalue = TextEditingController();
  double? kggvalue;
  double? poundvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'KG to Pound Converter',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        )),
        backgroundColor: Colors.white,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text Field to fetch Kg Value
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: TextFormField(
                cursorColor: Colors.green.shade900,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                controller: kgvalue,
                decoration: InputDecoration(
                  hintText: 'Enter Value in Kg',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.green.shade900,
                        width: 2.5,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.green.shade900,
                        width: 1.5,
                      )),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          //Button to convert the value
          GestureDetector(
            onTap: () {
              setState(() {
                double kggvalue = double.parse(kgvalue.text);
                poundvalue = kggvalue * 2.2;
              });
            },
            child: Container(
              height: 40,
              width: 210,
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Convert',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ),

          const SizedBox(height: 100),

          // Text to show kg value in pounds
          Center(
            child: Text(
              'Value in Pound is: ' '$poundvalue',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
