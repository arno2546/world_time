import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/Models/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime wt;
  @override
  Widget build(BuildContext context) {
    Map m = ModalRoute.of(context).settings.arguments;
    wt = m['wtObj'];
    print(wt.location);
    return Scaffold(
      body: SafeArea(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(wt.time,style: GoogleFonts.lato(fontSize: 65,fontWeight: FontWeight.bold, color: Colors.black),),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[                  
                  Text(wt.location,style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 2),)
              ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton.icon(onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    }, 
                    icon: Icon(Icons.edit_location, color: Colors.black,), 
                    label: Text('Change Location',style: GoogleFonts.lato(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),                                 
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Today is ',style: GoogleFonts.ubuntu(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(width: 5,),
                  RotateAnimatedTextKit(
                      text:['#${wt.dOfWeek} day of the week','#${wt.dOfYear} day of the year'],
                      textStyle: GoogleFonts.ubuntu(fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      repeatForever: true,
                      duration: Duration(seconds: 2),
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Text('Time Zone : ${wt.timeZone}',style: GoogleFonts.ubuntu()),
            ],
          ), 
        ),
    );
  }
}