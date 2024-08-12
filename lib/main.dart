import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ayshi Shannidhya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    }
    );
  }
    var wtController = TextEditingController();
    var ftController = TextEditingController();
    var inController = TextEditingController();
    var result = "";
    var bgcolor = Colors.deepPurple.shade50;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'BMI', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
                ),

                SizedBox(height: 20,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in inch)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),



                SizedBox(height: 15,),

                ElevatedButton(onPressed: (){



                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt != "" && ft !="" && inch !="")
                    {
                      //BMI calculation

                      var iWt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);


                      var totaliinch = (ift * 12) + iinch;
                      var totalcm = totaliinch * 2.54;
                      var totalm = totalcm/100;

                      var bmi = iWt/(totalm * totalm);

                      var msg = "";

                      if(bmi>25)
                        {
                          msg = "You Are Overweight";
                          bgcolor = Colors.orange.shade200;
                        }
                      else if(bmi<18)
                        {
                          msg = "You Are Underweight";
                          bgcolor = Colors.red.shade200;

                        }
                      else
                        {
                          msg = "You are Healthy, Eat Some Junk Bro";
                          bgcolor = Colors.green;
                        }

                      setState(() {
                        result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                      });



                    }

                  else
                    {
                      setState(() {
                        result = "Please Fill the blanks!!!";
                      });

                    }

                },
                  child: Text('Calculate', style: TextStyle(color: Colors.black),),
                ),





                Text(result, style: TextStyle(fontSize: 24),),

            TextButton(
              onPressed: () {
                // Handle press
                setState(() {
                  wtController.clear();
                  ftController.clear();
                  inController.clear();
                  result = '';
                  bgcolor = Colors.deepPurple.shade50;
                });

              },
              child: Text('Re-Calculate'),
            ),




            ],
            ),
          ),
        ),
      ),







    );
  }
}
