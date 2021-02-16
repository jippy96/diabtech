part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

// class SigninEventLoading extends SigninEvent {}

class SigninEventStart extends SigninEvent {
  final User user;

  SigninEventStart({@required this.user});
}

class SigninEventFailed extends SigninEvent {}
