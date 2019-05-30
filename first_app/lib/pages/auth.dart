import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {

  String _email;
  String _password;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), 
            fit: BoxFit.cover, 
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop)
          )
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Email', filled: true, fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      this._email= value; 
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.white),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      this._password = value; 
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Accept terms'),
                  value: this._acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      this._acceptTerms = !this._acceptTerms; 
                    });
                  },
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('LOGIN'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}