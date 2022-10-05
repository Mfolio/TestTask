import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test1/model/test_modul.dart';
import 'package:test1/services/test_repository.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetDataList>((event, emit) async {
      try {
        emit(TestLoading());
        final datalist = await _apiRepository.getData();
        emit(TestLoaded(datalist));
        if (datalist.error != null) {
          emit(TestError(datalist.error));
        }
      } on NetworkError {
        emit(TestError('Failed to fetch data'));
      }
    });
  }
}
