
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DomiciliosPage extends StatefulWidget {
  @override
  createState() => _DomiciliosState();
}

class _DomiciliosState extends State<DomiciliosPage> {

  String _producto = "pizza";
  final _txtprecio = TextEditingController();
  int _counter = 0;
  int _total = 0;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Domicilios"),
        ),

        body: _detallesProducto(),

        floatingActionButton: _crearBotones(),
    );
  }

  Widget _detallesProducto(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Producto: $_producto", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.green)),
            SizedBox(height: 25.0),
            SizedBox(height: 50,
            width: 150,
            child: TextField(
              controller: _txtprecio,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ] ,
              onChanged: (text){
                if(!text.isEmpty){
                  _calcularTotal();
                }
              },
              decoration: InputDecoration(
                  labelText: "Precio:",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black
                  )
              ),
            )),


            SizedBox(height: 25.0),
            Text("Cantidad: $_counter", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black)),
            SizedBox(height: 50.0),
            Text("Total: $_total", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.red))
          ],
        )
    );
  }
  
  Widget _crearBotones(){
    return   Container(
      decoration: BoxDecoration(
          color: Colors.grey[700],
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.blue,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(75.0),
            bottomLeft: Radius.circular(75.0),
          )
      ),
      margin: EdgeInsets.only(left: 100.0,right: 50.0,bottom: 5.0,top: 5.0), //ajustar el tamanio del manejador
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Icon(Icons.remove, color: Colors.yellow),
            onPressed: (){
              _decrementCounter();
              _calcularTotal();
            },),
          SizedBox(height: 28.0,),
          IconButton(icon: Icon(Icons.fiber_smart_record),
            onPressed: (){
              _reset();
              _calcularTotal();
            },),
          SizedBox(height: 28.0,),
          IconButton(icon: Icon(Icons.add, color: Colors.yellow),
            onPressed: (){
              _incrementCounter();
              _calcularTotal();
            },)
        ],

      ),
    );
  }

  void _reset(){
    setState(() => _counter = 0);
  }

  void _incrementCounter(){
    setState(() =>_counter++);

  }

  void _decrementCounter(){
    setState(() => _counter--);
  }

  void _calcularTotal(){
    setState(() {
      if(_txtprecio.text.isNotEmpty)
      _total = _counter * int.parse(_txtprecio.text);
    });
  }
}
