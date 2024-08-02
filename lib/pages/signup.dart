import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String age = '';
  String weight = '';
  String height = '';

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'age': age,
          'weight': weight,
          'height': height,
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign-Up Successful')));
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) => value!.isEmpty ? 'Enter your email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) => value!.isEmpty ? 'Enter your password' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                onChanged: (value) => age = value,
                validator: (value) => value!.isEmpty ? 'Enter your age' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight'),
                onChanged: (value) => weight = value,
                validator: (value) => value!.isEmpty ? 'Enter your weight' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height'),
                onChanged: (value) => height = value,
                validator: (value) => value!.isEmpty ? 'Enter your height' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
