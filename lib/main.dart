import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time and Date picker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? time;
  String? date;

  pickTime(context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    //print(pickedTime);
    time = '${pickedTime!.hour}:${pickedTime.minute} ${pickedTime.period}';
    setState(() {});
  }

  pickDate(context) async {
    final pickdDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    //print(pickdDate);
    date = '${pickdDate!.day}/${pickdDate.month}/${pickdDate.year}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time and Date picker"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Picked time is: $time",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () => pickTime(context),
              child: Text("Tie Picker"),
            ),
            Text(
              "Picked date is: $date",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pickDate(context);
              },
              child: Text("Date Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
