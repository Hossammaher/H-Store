import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Widgets/TextFormWidget.dart';
import 'package:h_store/cubit/auth_cubit/auth_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterForm extends StatelessWidget {
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state is RegisterLoading) {
      isLoading = true ;
    }  else if (state is RegisterSuccess) {
      showSnakeBar(context, 'Register Success ');
      isLoading = false ;
      Future.delayed(Duration.zero, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        },));
      });
    } else if (state is RegisterFailure) {
      isLoading = false ;
      showSnakeBar(context, state.errMessage);

    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 24,
                ),
                TextFormWidget(
                  text: 'Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormWidget(
                  text: 'Password ',
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),

                const SizedBox(height: 32.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {

                        if (formKey.currentState!.validate()) {

                          BlocProvider.of<AuthCubit>(context).registerUser(email: email!, password: password!);
                          isLoading = false ;
                        } else {

                        }

                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     // Implement registration logic here
                //   },
                //   child: Text('Register'),
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white,
                //     onPrimary: Colors.blue,
                //     textStyle: TextStyle(
                //       fontSize: 16.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     padding: EdgeInsets.symmetric(vertical: 16.0),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }

  void showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
