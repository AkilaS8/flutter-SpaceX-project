import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:space_x/features/feature_company/data/data_source/remote_data_data_source/company_remote_data_data_source.dart';
import 'package:space_x/features/feature_company/data/repositories/company_repository.dart';
import 'package:space_x/features/feature_company/domain/repositories/company_repository.dart';
import 'package:space_x/features/feature_company/domain/usecases/company_usecase.dart';
import 'package:space_x/features/feature_company/presentation/bloc/company_bloc.dart';
import 'package:space_x/features/feature_dragon/data/data_sources/remote_data_source/dragons_remote_data_source.dart';
import 'package:space_x/features/feature_dragon/data/repositories/dragons_repository.dart';
import 'package:space_x/features/feature_dragon/domain/repositories/dragon_repository.dart';
import 'package:space_x/features/feature_dragon/domain/usecases/dragons_usecase.dart';
import 'package:space_x/features/feature_dragon/presentation/bloc/dragons_bloc.dart';
import 'package:space_x/features/feature_history/data/data_sources/history_remote_data_source.dart';
import 'package:space_x/features/feature_history/data/repositories/history_repository.dart';
import 'package:space_x/features/feature_history/domain/repositories/history_repository.dart';
import 'package:space_x/features/feature_history/domain/use_cases/history_usecase.dart';
import 'package:space_x/features/feature_history/presentation/bloc/history_bloc.dart';
import 'package:space_x/features/feature_launches_past/data/data_sources/past_remote_data_source.dart';
import 'package:space_x/features/feature_launches_past/data/repositories/past_repositories.dart';
import 'package:space_x/features/feature_launches_past/domain/repositories/past_repositories.dart';
import 'package:space_x/features/feature_launches_past/domain/usecases/past_usecase.dart';
import 'package:space_x/features/feature_launches_past/presentation/bloc/past_bloc.dart';
import 'package:space_x/features/feature_launches_upcoming/data/data_sources/remote_data_sources/upcoming_remote_data_source.dart';
import 'package:space_x/features/feature_launches_upcoming/data/repositories/upcoming_repository.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/repositories/upcoming_repository.dart';
import 'package:space_x/features/feature_launches_upcoming/domain/usecases/upcoming_usecase.dart';
import 'package:space_x/features/feature_launches_upcoming/presentation/bloc/upcoming_bloc.dart';
import 'package:space_x/features/feature_missions/data/data_source/remote_data_source/missions_remote_data_data_source.dart';
import 'package:space_x/features/feature_missions/data/repositories/missions_repository.dart';
import 'package:space_x/features/feature_missions/domain/repositories/missions_repository.dart';
import 'package:space_x/features/feature_missions/domain/usecases/missions_usecase.dart';
import 'package:space_x/features/feature_missions/presentation/bloc/missions_bloc.dart';
import 'package:space_x/features/feature_next_lunch/data/repositories/next_repository.dart';
import 'package:space_x/features/feature_next_lunch/domain/repositories/next_repository.dart';
import 'package:space_x/features/feature_next_lunch/domain/usecses/next_usecase.dart';
import 'package:space_x/features/feature_next_lunch/presentation/bloc/next_bloc.dart';
import 'package:space_x/features/feature_rockets/data/data_sources/remote_data_source/rockets_remote_data_source.dart';
import 'package:space_x/features/feature_rockets/data/repositories/rockets_repository.dart';
import 'package:space_x/features/feature_rockets/domain/repositories/rockets_repository.dart';
import 'package:space_x/features/feature_rockets/domain/usecases/rockets_usecase.dart';
import 'package:space_x/features/feature_rockets/presentation/bloc/rockets_bloc.dart';
import 'package:space_x/features/feature_ships/data/data_source/remote_data_source/ships_remote_data_data_source.dart';
import 'package:space_x/features/feature_ships/data/repositories/ships_repository.dart';
import 'package:space_x/features/feature_ships/domain/repositories/ships_repository.dart';
import 'package:space_x/features/feature_ships/domain/usecases/ships_usecase.dart';
import 'package:space_x/features/feature_ships/prersentation/bloc/ships_bloc.dart';

import 'core/network/network_info.dart';
import 'features/feature_next_lunch/data/data_sources/remote_data_sources/next_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///!!! Bloc
  //rockets
  sl.registerLazySingleton(
    () => RocketsBloc(
      useCase: sl(),
    ),
  );
  //dragons
  sl.registerLazySingleton(
        () => DragonsBloc(
      useCase: sl(),
    ),
  );
  //ships
  sl.registerLazySingleton(
        () => ShipsBloc(
      useCase: sl(),
    ),
  );
  //missions
  sl.registerLazySingleton(
        () => MissionsBloc(
      useCase: sl(),
    ),
  );
  //history
  sl.registerLazySingleton(
        () => HistoryBloc(
      useCase: sl(),
    ),
  );
  //company
  sl.registerLazySingleton(
        () => CompanyBloc(
      useCase: sl(),
    ),
  );

  //Upcoming_Launches
  sl.registerLazySingleton(
        () => UpcomingBloc(
      useCase: sl(),
    ),
  );

  //Past_Launches
  sl.registerLazySingleton(
        () => PastBloc(
      UseCase: sl(),
    ),
  );

  //NExt_Launches
  sl.registerLazySingleton(
        () => NextBloc(
      UseCase: sl(),
    ),
  );




  ///!!! Data Sources
  //rockets
  sl.registerLazySingleton<RocketRemoteDataSource>(
    () => RocketsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  //dragons
  sl.registerLazySingleton<DragonRemoteDataSource>(
        () => DragonsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  //ships
  sl.registerLazySingleton<ShipsRemoteDataSource>(
        () => ShipsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  //missions
  sl.registerLazySingleton<MissionsRemoteDataSource>(
        () => MissionsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  //history
  sl.registerLazySingleton<HistoryRemoteDataSource>(
        () => HistoryRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  //company
  sl.registerLazySingleton<CompanyRemoteDataSource>(
        () => CompanyRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  //Upcoming_Launches
  sl.registerLazySingleton<UpcomingRemoteDataSource>(
        () => UpcomingRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  //Past_Launches
  sl.registerLazySingleton<PastRemoteDataSource>(
        () => PastRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  //Next_Launches
  sl.registerLazySingleton<NextRemoteDataSource>(
        () => NextRemoteDataSourceImpl(
      client: sl(),
    ),
  );



  ///!!! Repositories
  //rockets
  sl.registerLazySingleton<RocketsRepository>(
    () => RocketsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //dragons
  sl.registerLazySingleton<DragonsRepository>(
        () => DragonsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //ships
  sl.registerLazySingleton<ShipsRepository>(
        () => ShipsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //missions
  sl.registerLazySingleton<MissionsRepository>(
        () => MissionsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //history
  sl.registerLazySingleton<HistoryRepository>(
        () => HistoryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //company
  sl.registerLazySingleton<CompanyRepository>(
        () => CompanyRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Upcoming_Launches
  sl.registerLazySingleton<UpcomingRepository>(
        () => UpcomingRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Past_Launches
  sl.registerLazySingleton<PastRepository>(
        () => PastRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //Next_Launches
  sl.registerLazySingleton<NextRepository>(
        () => NextRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );




  ///!!! Use Cases
  //rockets
  sl.registerLazySingleton(
    () => GetRocketsUseCase(
      sl(),
    ),
  );
  //dragons
  sl.registerLazySingleton(
        () => GetDragonsUseCase(
      sl(),
    ),
  );
  //ships
  sl.registerLazySingleton(
        () => GetShipsUseCase(
      sl(),
    ),
  );
  //missions
  sl.registerLazySingleton(
        () => GetMissionsUseCase(
      sl(),
    ),
  );
  //history
  sl.registerLazySingleton(
        () => GetHistoryUseCase(
      sl(),
    ),
  );
  //company
  sl.registerLazySingleton(
        () => GetCompanyUseCase(
      sl(),
    ),
  );

  //Upcoming_Launches
  sl.registerLazySingleton(
        () => GetUpcomingUseCase(
      sl(),
    ),
  );

  //Past_Launches
  sl.registerLazySingleton(
        () => GetPastUseCase(
      sl(),
    ),
  );
  //Next_Launches
  sl.registerLazySingleton(
        () => GetNextUseCase(
      sl(),
    ),
  );

  ///!!! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );

  sl.registerLazySingleton(() => http.Client());


  ///!!! External
  sl.registerLazySingleton(() => Connectivity());
}
