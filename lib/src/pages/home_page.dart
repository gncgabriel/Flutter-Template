import 'package:flutter_template/src/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_template/src/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: BlocProvider.of<HomeCubit>(context),
          builder: (context, state) {
            if (state is HomeInitial) {
              return _HomeInitialState();
            }

            if (state is HomeInProgress) {
              return _HomeLoadingState();
            }

            if (state is HomeError) {
              return Text("Ocorreu um erro");
            }

            return _HomeSuccess();
          },
        ),
      ),
    );
  }
}

class _HomeInitialState extends StatelessWidget {
  const _HomeInitialState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bem vindo"),
        MaterialButton(
          color: Colors.green,
          child: Text("Iniciar"),
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).initHome();
          },
        )
      ],
    );
  }
}

class _HomeLoadingState extends StatelessWidget {
  const _HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _HomeSuccess extends StatelessWidget {
  const _HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Home Iniciada com sucesso"),
        SizedBox(
          height: 24,
        ),
        MaterialButton(
          color: Colors.blue,
          child: Text("Reiniciar"),
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).reset();
          },
        )
      ],
    );
  }
}
