import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/Models/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void updateWt(timeZones,index)async{
    WorldTime wt =  WorldTime(location: timeZones[index].toString().split('/')[1],url:timeZones[index].toString());
    await wt.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{'wtObj':wt});
  }

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
                onTap: (){
                  updateWt(timeZones, index);
                },
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