import 'package:flutter/material.dart';
import 'package:squid_foods/pages/HomePage.dart';
import 'package:squid_foods/pages/StarterPage.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto'),
    home: StarterPage() ,
  )
);

