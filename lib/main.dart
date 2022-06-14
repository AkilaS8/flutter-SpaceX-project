import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:space_x/features/feature_login/authentication/data/data_source/authentication_firebase_data_source.dart';
import 'package:space_x/features/feature_splash_screen/pages/splash_screen.dart';

import 'features/feature_login/authentication/data/data_source/google_sign_in_data_source.dart';
import 'features/feature_login/authentication/data/repositories/authentication_repository.dart';
import 'features/feature_login/authentication/observer/bloc_observer.dart';
import 'features/feature_login/authentication/presentation/bloc/authentication_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: AuthenticationRepository(
          authenticationFirebaseProvider: AuthenticationFirebaseDataSource(
            firebaseAuth: FirebaseAuth.instance,
          ),
          googleSignInProvider: GoogleSignInDataSource(
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
