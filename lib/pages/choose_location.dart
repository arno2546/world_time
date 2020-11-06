import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  Widget build(BuildContext context) {
    Map m = ModalRoute.of(context).settings.arguments;
    List timeZones = m['timeZones'];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location',style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: ListView.builder
        (
          itemCount: timeZones.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){},
                title:Row(
                  children: [
                    Expanded(child: Text(timeZones[index],style: GoogleFonts.lato(fontSize: 18),)),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            );
          }
        ),
    );
  }
}