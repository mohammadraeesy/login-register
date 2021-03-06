import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register/core/constant/Text.dart';
import 'package:login_register/core/widgets/background.dart';
import 'package:login_register/features/activation/presentation/pages/activation_page.dart';
import 'package:login_register/features/login/presentation/pages/login_page.dart';
import 'package:login_register/features/register/presentation/bloc/register_bloc.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerPoneNumber = TextEditingController();
  final controllerEmail = TextEditingController();
  String inputUsername;
  String inputPassword;
  String inputFirstName;
  String inputLastName = '1';
  String inputPoneNumber = '1';
  String inputEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) async{
          if (state is Loaded) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 5),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.massage),
                  ],
                ),
              ));
            await Future.delayed(Duration(seconds: 5));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ActivationPage(inputUsername)));
          } else if (state is Loading) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 10),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Loading'),
                    CircularProgressIndicator(),
                  ],
                ),
              ));
            await Future.delayed(Duration(seconds: 15));
          }else if (state is Error){
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 10),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.message),
                  ],
                ),
              ));

          }
        },
        // ignore: missing_return
        builder: (context, state) {
          return RegisterScreen(context);
        },
      ),
    );
  }

  Widget RegisterScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                ConstantText.headerRegisterScreen,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(labelText: ConstantText.headerTextFieldName),
                onChanged: (value) {
                  inputFirstName = value;
                },
                onSubmitted: (_) {
                  GoToLoginPage(context);
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(labelText: ConstantText.headerTextFieldEmail),
                onChanged: (value) {
                  inputEmail = value;
                },
                onSubmitted: (_) {
                  GoToLoginPage(context);
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(labelText: ConstantText.headerTextFieldUsername),
                onChanged: (value) {
                  inputUsername = value;
                },
                onSubmitted: (_) {
                  GoToLoginPage(context);
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(labelText: ConstantText.headerTextFieldPassword),
                obscureText: true,
                onChanged: (value) {
                  inputPassword = value;
                },
                onSubmitted: (_) {
                  GoToLoginPage(context);
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () => GoToLoginPage(context),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    ConstantText.buttonRegister,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                },
                child: Text(
                  ConstantText.buttonSingUpToLogin,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void GoToLoginPage(context) {
    controllerUsername.clear();
    controllerPassword.clear();
    controllerFirstName.clear();
    controllerLastName.clear();
    controllerPoneNumber.clear();
    controllerEmail.clear();

    if (controllerUsername == null ||
        controllerPassword == null ||
        controllerFirstName == null ||
        controllerLastName == null ||
        controllerPoneNumber == null ||
        controllerEmail == null) {
      SnackBar(content: Text('please fill all fields '));
    } else {
      BlocProvider.of<RegisterBloc>(context).add(clickButtonPress(
          inputUsername,
          inputPassword,
          inputPoneNumber,
          inputEmail,
          inputFirstName,
          inputLastName));
    }
  }
}

