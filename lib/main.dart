import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/widgets/massage_display.dart';
import 'core/widgets/splash_page.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return di.sl<AuthenticationBloc>()..add(AppStarted());
    },
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EBook',
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/Login': (context) => LoginPage(),
      // }, // false talk about
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return MessageDisplay(message: 'What!');
          }
          if (state is Unauthenticated) {
            return LoginPage();
          }
          return SplashPage();
        },
      ),
    );
  }
}
