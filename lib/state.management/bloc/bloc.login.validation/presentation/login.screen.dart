import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/constants.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/bloc/auth.bloc.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/presentation/user.screen.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/widgets/pallete.dart';

import '../widgets/gradient.button.dart';
import '../widgets/login_field.dart';
import '../widgets/social.button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (state is AuthSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successful login'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const UserData()));
      }
    }, builder: (context, state) {
      if (state is AuthInProgress) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        backgroundColor: const Color.fromARGB(66, 141, 140, 140),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('${smImage}signin_balls.png'),
                const Text(
                  'Sign in.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                const SocialButton(
                    iconPath: '${smSVG}g_logo.svg',
                    label: 'Continue with Google'),
                const SizedBox(height: 20),
                const SocialButton(
                  iconPath: '${smSVG}f_logo.svg',
                  label: 'Continue with Facebook',
                  horizontalPadding: 90,
                ),
                const SizedBox(height: 15),
                const Text(
                  'or',
                  style: TextStyle(
                    fontSize: 17,
                    color: Pallete.whiteColor,
                  ),
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                GradientButton(
                  onPress: () {
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            username: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
