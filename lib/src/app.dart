
import 'package:flutter/material.dart';

import 'package:domicilios_app/src/pages/domicilios_page.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DomiciliosPage(),
    );
  }

}