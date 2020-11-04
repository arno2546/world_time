import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/Models/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> { 

  void setWorldTime()async{
    WorldTime wt = WorldTime(location:'Dhaka',flag:'japan.png',url:'asia/dhaka');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {'wtObj':wt});
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 70,
          ),
          SizedBox(height:20),
          Text('Loading..',style: GoogleFonts.lato(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,))
        ],
      ),
    );
  }
}