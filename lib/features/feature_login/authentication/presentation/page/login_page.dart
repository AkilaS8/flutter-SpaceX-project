//import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_login/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:space_x/features/feature_navigation_drawer/pages/main_menu_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: kBackgroundGradient,
            ),
          ),
          child: Builder(
            builder: (context) {
              return BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenu(
                                  userDeatils: state.authenticationDetail,
                                )));
                  } else if (state is AuthenticationFailiure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                buildWhen: (current, next) {
                  if (next is AuthenticationSuccess) {
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  if (state is AuthenticationInitial ||
                      state is AuthenticationFailiure) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: 'logo',
                            child: Image(
                              image: AssetImage('assets/images/space_x_2.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage('assets/images/dragon.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: GoogleAuthButton(
                                  onPressed: () =>
                                      BlocProvider.of<AuthenticationBloc>(
                                              context)
                                          .add(
                                    AuthenticationGoogleStarted(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // OutlinedButton(
                        //   onPressed: () =>
                        //       BlocProvider.of<AuthenticationBloc>(context).add(
                        //         AuthenticationGoogleStarted(),
                        //       ),
                        //   child: Text('Login with Google'),
                        // ),
                      ],
                    );
                  } else if (state is AuthenticationLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                      child: Text('Undefined state : ${state.runtimeType}'));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
