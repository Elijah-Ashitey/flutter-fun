import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/app.bloc.observer.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/bloc/auth.bloc.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.start.dart';
import 'state.management/bloc/bloc.counter.app/cubit/counter.cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Bloc.observer = AppBlocOberver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Hub',
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeServices().theme,
        home: const AppStart(),
      ),
    );
  }
}
