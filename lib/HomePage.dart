import 'package:flutter/material.dart';
class HomePage extends StatelessWidget{

  String name;

  HomePage({Required, this.name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Second Screen',style: TextStyle(color: Colors.black87,),),
      ),
      body: Column(
        children:<Widget>[
          SizedBox(height: 20,),
          Text('  Walcome :'),
          Text('  ${name}',style: TextStyle(fontSize: 20),
          ),

          SizedBox(
            height: 188,
          ),

          Container(


            child: Text('Selected User Name', style: TextStyle(fontSize: 30,),),
          ),

          SizedBox(
            height: 188,
          ),

          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => List<name>(),);
          },
            child: const Text(' Choose a User '),)
        ],

      ),
    );
  }
}

