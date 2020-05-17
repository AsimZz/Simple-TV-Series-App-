import 'package:flutter/material.dart';
import 'package:tv_series/test.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(top: 75),
          child: ListView(
            children: <Widget>[
              Text(
                'Welcome back.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'enter username',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'enter email',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'enter password',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'confirm password',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => TestApi()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF9E1F28),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '- or -',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 30, top: 15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'G',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'f',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
