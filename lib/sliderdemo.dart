import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  double a=1,b=1,c=1;
  @override
  Widget build(BuildContext context)
  {

    SliderThemeData std1 = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible
    );
    SliderThemeData std2 = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible
    );
    SliderThemeData std3 = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible
    );

    Slider s1 = Slider(label:"$a",min:1,max:5, divisions:4,value: a, onChanged: (value){

      setState(() {

         a=value;

      });

    });
    Slider s2 = Slider(label:"$b",min:1,max:5, divisions:4,value: b, onChanged: (value){

      setState(() {

        b=value;

      });

    });
    Slider s3 = Slider(label:"$c",min:1,max:5, divisions:4,value: c, onChanged: (value){

      setState(() {

        c=value;

      });

    });

   SliderTheme st1 = SliderTheme(data: std1, child: s1);
    SliderTheme st2 = SliderTheme(data: std2, child: s2);
    SliderTheme st3 = SliderTheme(data: std3, child: s3);


    // RotatedBox rotatedBox =RotatedBox(quarterTurns: -1,child:slider);

   // SliderTheme sliderTheme = SliderTheme(data: sliderThemeData, child: rotatedBox);

    TextEditingController tec = TextEditingController();
    TextField result  = TextField(controller: tec,);
    ElevatedButton elevatedButton = ElevatedButton(onPressed: (){
      if(a>b){
        if(a>c){
          tec.text = "A is max: $a";
        }
      }else{
        if(b>c){
          tec.text = "B is max: $b";
        }else{
          tec.text = "C is max: $c";
        }
      }
    }, child: Text("Show Max"));

    SizedBox sizedBox = SizedBox(height: 20,);
    Column column = Column(mainAxisSize: MainAxisSize.max,children: [st1,sizedBox,st2,sizedBox,st3,sizedBox,elevatedButton,sizedBox, result],);

    Center center = Center(child:column);
    AppBar appBar = AppBar(title: const Text("Slider Demo"),backgroundColor:Colors.limeAccent ,);
    Scaffold s = Scaffold(appBar:appBar,body:center);
    MaterialApp m = MaterialApp(home:s,debugShowCheckedModeBanner: false,);
    return m;

  }
}
