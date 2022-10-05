part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
  
  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final DataModel dataModel;
  TestLoaded(this.dataModel);
}

class TestError extends TestState {
  final String? message;
  TestError(this.message);
}

