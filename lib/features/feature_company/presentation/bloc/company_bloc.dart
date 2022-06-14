import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_company/domain/entities/response/company_data_entity.dart';
import 'package:space_x/features/feature_company/domain/usecases/company_usecase.dart';

part 'company_events.dart';
part 'company_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetCompanyUseCase useCase;

  CompanyBloc({required this.useCase}) : super(CompanyInitialState());

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    if (event is GetCompanyDataListEvent) {
      yield CompanyLoadingState();
      final failureOrCompanyData = await useCase(NoParams());
      yield failureOrCompanyData.fold(
              (failure) =>
                  CompanyErrorState(errorMessage: _mapFailureToMessage(failure)),
              (companyData) => CompanyLoadedState(companyList: companyData));
    }
    //yield CompanyErrorState(errorMessage: 'Unexpected Error');

  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

}