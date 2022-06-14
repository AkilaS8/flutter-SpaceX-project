part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
}

class GetCompanyDataListEvent extends CompanyEvent {
  @override
  List<Object?> get props => [];
}