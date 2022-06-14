import 'package:dartz/dartz.dart';
import 'package:space_x/core/error/exception.dart';
import 'package:space_x/core/error/failures.dart';
import 'package:space_x/core/network/network_info.dart';
import 'package:space_x/features/feature_company/data/data_source/remote_data_data_source/company_remote_data_data_source.dart';
import 'package:space_x/features/feature_company/domain/entities/response/company_data_entity.dart';
import 'package:space_x/features/feature_company/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final NetworkInfo networkInfo;
  final CompanyRemoteDataSource remoteDataSource;

  CompanyRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, CompanyDataModelEntity>> getCompanyData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCompanyDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
