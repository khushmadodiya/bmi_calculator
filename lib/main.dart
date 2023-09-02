
import 'package:untitled5/splesh.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  splesh(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtc= TextEditingController();

  var htc= TextEditingController();

  var inc= TextEditingController();

  var result="";
  var c="";
  var bgcolor = Colors.deepPurple.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text("BMI",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),)),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40.0,top: 8.0),

                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(child: Text( "$result \n $c ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text("BMI",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: wtc,
                        decoration: InputDecoration(
                          label: Center(child: Text("Enter your weight",style: TextStyle(fontSize: 20),)),
                          prefix: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number,

                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: htc,
                        decoration: InputDecoration(
                          label: Center(child: Text("Enter your height(inFeet)",style: TextStyle(fontSize: 20),)),
                          prefix: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: inc,
                        decoration: InputDecoration(
                          label:
                          Center(child: Text("Enter your weight(inInches)",style: TextStyle(fontSize: 20),)),

                          prefix: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(onPressed: (){
                        var wt = wtc.text.toString();
                        var ht = htc.text.toString();
                        var inh = inc.text.toString();
                        if(wt!=""&& ht!=""&& inh!=""){
                          var iwt= double.parse(wt);
                          var iht = int.parse(ht);
                          var iInch = int.parse(inh);
                          if(iwt<0 || iwt> 150){
                            setState(() {
                              result="weight can't be negative and  not more than 150";
                              c="";
                            });

                          }
                          else if(iht<0 || iht >10){
                            setState(() {
                              result="height can't be negative and not more than 10";
                              c="";
                            });

                          }
                          else if(iInch<0 || iInch>12){
                            setState(() {
                              result="inches can't be negative and not more than 12";
                              c="";
                            });

                          }
                          else {
                            var tInch = (iht * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tm = tCm / 100;
                            var bmi = (iwt / (tm * tm));
                            setState(() {
                              result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                              if (bmi < 18) {
                                bgcolor = Colors.orange.shade300;
                                c = "You are Under Weight";
                              }
                              else if (bmi > 32) {
                                bgcolor = Colors.red.shade400;
                                c = "You are Over Weight";
                              }
                              else {
                                bgcolor = Colors.green.shade400;
                                c = "You are Helthy";
                              }
                            });
                          }

                        }
                        else{
                          setState(() {
                            result= "Please fill all the fields";

                          });

                        }
                      }, child: Text('Calculate')),
                      SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(onPressed: (){
                        setState(() {
                          result= "";
                          c="";
                          bgcolor = Colors.deepPurple.shade50;
                          wtc.clear();
                          htc.clear();
                          inc.clear();
                        });
                      }, child: Icon(Icons.refresh)),
                    ],
                  ),

                ),
              )
          ),
        )

    );
  }
}

