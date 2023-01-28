import 'package:flutter/material.dart';
import 'package:palidrome/HomePage.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _pName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = new TextEditingController();

  Widget _buildInputField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter number',),

      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter only numer!';
        }
      },
      onSaved: (String value) {
        _pName = value;
      },
    );
  }

// ignore: missing_return
  void callPalindrome(_pName) {
    int p = int.parse(_pName);
    int rev = 0 ,
        sum = 0 ,
        temp = p;

    while (p > 0) {
      sum = (sum * 10) + (p % 10);
      p = (p / 10).floor();
      print(p);
    }

    if (temp == sum) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Result"),
                content: Text("numer is a Palindrome."),
                actions: [
                  FloatingActionButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    }
    else
      //  if (temp != sum) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Result"),
                content: Text("Number is not a Palindrome."),
                );
          });
    //}
  }

  Widget _buildInputFieldName(){
    return TextFormField(
      controller: _name,
        decoration: InputDecoration(labelText: 'Enter Name',),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Palindrome Test"))),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.black87,
                          shape: BoxShape.circle
                      ),
                      child: const Center(
                        child: Icon(Icons.person_add_alt_outlined, size: 50,
                          color: Colors.white,),
                      ),
                    ),
                    _buildInputFieldName(),
                    _buildInputField(),
                    SizedBox(height: 100),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        shape: const StadiumBorder(),
                        elevation: 5,
                      ),
                      onPressed: (){
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        callPalindrome(_pName);
                      },
                      child: Text(
                        '     Check      ', style: TextStyle(fontSize: 20),),
                    ),

                    SizedBox(height: 20,),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        shape: const StadiumBorder(),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              HomePage(name: _name.text)),);
                      },
                      child: Text('     Next     ', style: TextStyle(fontSize: 20),),)
                  ],
                ))));
  }
}