import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/Models/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading2 extends StatefulWidget {
  @override
  _Loading2State createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
  List timeZones;

  Future<void> getTimeZones() async {
     try {
        Response response = await get('http://worldtimeapi.org/api/timezone');
        timeZones = jsonDecode(response.body);
        print(timeZones);
    } catch (e) {
      timeZones.add('Could not fetch data');
    }
  }

  void initTimeZoneList()async{
    await getTimeZones();
    Navigator.pushReplacementNamed(context,'/location',arguments: {'timeZones':timeZones});
  }

  @override
  void initState() {
    initTimeZoneList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading....'),
      ),
    );
  }
}