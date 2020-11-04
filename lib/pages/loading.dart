import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/Models/world_time.dart';

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
      appBar:AppBar(
        title: Text("Loading....",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(child: Text('Loading.....', style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.bold),)),
    );
  }
}