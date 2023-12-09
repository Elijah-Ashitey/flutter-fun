import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/bloc/auth.bloc.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/presentation/login.screen.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/widgets/gradient.button.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is AuthInitial) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Successful login'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        builder: (context, state) {
          if (state is AuthInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Center(
                child: Text((state as AuthSuccess).username),
              ),
              GradientButton(onPress: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              })
            ],
          );
        },
      ),
    );
  }
}
