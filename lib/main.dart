import 'package:app_financeiro/src/cubits/home_cubit/home_cubit.dart';
import 'package:app_financeiro/src/factories/cubits.dart';
import 'package:app_financeiro/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => makeHomeCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        onGenerateRoute: (settings) {
          final route = Routes.getRoutes()[settings.name];
          return MaterialPageRoute(
            builder: (context) => route!(context),
            settings: settings,
          );
        },
        initialRoute: "home",
      ),
    );
  }
}
