part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();
}

class CompanyInitialState extends CompanyState {
  @override
  List<Object?> get props => [];
}

class CompanyLoadingState extends CompanyState {
  @override
  List<Object?> get props => [];
}

class CompanyLoadedState extends CompanyState {
  final CompanyDataModelEntity companyList;

  CompanyLoadedState({required this.companyList});

  @override
  List<Object?> get props => [companyList];
}

class CompanyErrorState extends CompanyState {
  final String errorMessage;

  CompanyErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}