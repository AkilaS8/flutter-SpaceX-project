import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/usecase/usecase.dart';
import 'package:space_x/features/feature_company/domain/entities/response/company_data_entity.dart';
import 'package:space_x/features/feature_company/domain/repositories/company_repository.dart';

class GetCompanyUseCase extends UseCase<CompanyDataModelEntity, NoParams> {
  final CompanyRepository repository;

  GetCompanyUseCase(this.repository);

  @override
  Future<Either<Failure, CompanyDataModelEntity>> call(NoParams params) {
    return repository.getCompanyData();
  }
}