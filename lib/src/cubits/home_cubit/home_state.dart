import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {
  final String mensagem;

  HomeSuccess({
    required this.mensagem,
  });

  @override
  List<Object?> get props => [mensagem];

}

class HomeError extends HomeState {}