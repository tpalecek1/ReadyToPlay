import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import '../services/auth.dart';
import 'home.dart';

class SignupLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Body()
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthenticationService();

  String _email;
  String _password;

  bool _isLoginForm;
  bool _isProcessing;
  bool _hasInvalidInput;

  @override
  void initState() {
    super.initState();
    _isLoginForm = true;
    _isProcessing = false;
    _hasInvalidInput = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
                children: [
                  _emailField(),
                  SizedBox(height: 10),
                  _passwordField(),
                  SizedBox(height: 25),
                  _submitButton(),
                  SizedBox(height: 5),
                  _toggleButton(),
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      autovalidate: _hasInvalidInput ? true : false,
      enabled: _isProcessing ? false : true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.mail, color: Colors.grey),
          hintText: 'Email',
      ),
      validator: (email) => EmailValidator.validate(email.trim()) ? null : 'Invalid email address',
      onSaved: (email) => _email = email.trim(),
    );
  }

  Widget _passwordField() {
    return  TextFormField(
      autovalidate: _hasInvalidInput ? true : false,
      enabled: _isProcessing ? false : true,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.grey),
        hintText: 'Password',
      ),
      validator: (password) => password.length < 6 ? 'Invalid password (at least 6 characters)' : null,
      onSaved: (password) => _password = password,
    );
  }

  Widget _toggleButton() {
    return  FlatButton(
      child: Text(_isLoginForm ? 'Don\'t have an account? Sign up' : 'Already have an account? Log in'),
      onPressed: () {
        if (!_isProcessing) {
          _formKey.currentState.reset();
          setState(() { _isLoginForm = !_isLoginForm; _hasInvalidInput = false; });
        }
      },
    );
  }

    Widget _submitButton() {
    return  ProgressButton(
      animate: false,
      borderRadius: 20,
      height: 40.0,
      defaultWidget: Text(_isLoginForm ? 'Log in' : 'Sign up', style: TextStyle(fontSize: 16.0)),
      progressWidget: SizedBox(
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
      ),
      onPressed: () async {
        if (!_isProcessing) {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            setState(() { _isProcessing = true; _hasInvalidInput = false; });
            try {
              String user = _isLoginForm ?
                await _auth.loginWithEmail(_email, _password) :
                await _auth.signUpwWithEmail(_email, _password) ;

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Home(userId: user,))
              );
            }
            catch (errorMsg) {
              setState(() => _isProcessing = false);
              _formKey.currentState.reset();
              await _alert('${ _isLoginForm ? 'Log in' : 'Sign up'} failed', errorMsg);
            }
          }
          else {
            setState(() => _hasInvalidInput = true);
          }
        }
      },
    );
  }

    Future _alert(title, msg) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: Text(msg)),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}