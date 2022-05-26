import 'package:flutter/material.dart';
import 'package:project/pages/authpage.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const route = '/';
  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //const LoginPage({Key? key}) : super(key: key);
  String email = 'bug@expert.com';

  final inputBorder = const BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );

  Future<String> _loginUser(LoginData data) async {
    if (data.name == email && data.password == '0000') {
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);
      return '';
    } else {
      return 'Oops! We could not find matching credentials';
    }
  }

  // _loginUser
  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  }

  // _signUpUser
  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  }

  // _recoverPassword
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MyMo',
      logo: const AssetImage('assets/logo/def1.png'),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        Navigator.of(context).pushReplacementNamed(AuthPage.route);
      },
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(
            255, 244, 190, 110), //colore principale = a quello di SIGN UP
        pageColorLight:
            const Color.fromARGB(255, 239, 65, 123), //colore secondario
        accentColor: const Color.fromARGB(
            255, 171, 231, 179), // colore del rettangolino dell'animazione
        errorColor: Colors.red,
        beforeHeroFontSize: 65, // dimensione del titolo
        titleStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Audiowide', // carattere personalizzato aggiunto
          letterSpacing: 10,
        ),
        bodyStyle: const TextStyle(
          //password dimenticata
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          color: Color.fromARGB(255, 87, 86, 86),
          fontFamily: 'OpenSans',
          fontSize: 16,
          shadows: [
            Shadow(color: Color.fromARGB(255, 210, 239, 244), blurRadius: 2)
          ],
          letterSpacing: 2,
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontFamily: 'Quicksand',
          color: Colors.white,
          fontSize: 16,
          letterSpacing: 3,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.only(top: 20),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(60.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: false,
          fillColor: const Color.fromARGB(255, 227, 189, 169)
              .withOpacity(.1), //rettangolini delle credenziali
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            color: Colors.red,
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
              fontSize: 15, fontFamily: 'Quicksand'), // credenziali
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
                color:
                    Color.fromARGB(255, 235, 109, 36), //linea delle credenziali
                width: 3), //255, 189, 189, 235
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.red,
                width: 7), // linea delle credenziali se errore
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 158, 216, 160), width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.red, //255, 185, 223, 234
          backgroundColor:
              const Color.fromARGB(255, 235, 153, 47), //255, 101, 173, 232
          highlightColor: Colors.yellow,
          elevation: 10,
          highlightElevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
        logoWidth: 1, //dimensioni logo, massimo =1
      ),
    );
  }
}
