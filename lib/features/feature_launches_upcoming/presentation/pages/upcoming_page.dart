import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/loadings/rockets_loading_view.dart';
import 'package:space_x/features/feature_launches_upcoming/presentation/bloc/upcoming_bloc.dart';
import 'package:space_x/features/feature_launches_upcoming/presentation/widgets/upcoming_list_tile.dart';

import '../../../../injection_container.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  final bloc = sl<UpcomingBloc>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: kBackgroundGradient,
        ),
      ),
      child: buildBody(),
    );
  }

  BlocProvider<UpcomingBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<UpcomingBloc, UpcomingState>(
        builder: (context, state) {
          if (state is UpcomingInitialState) {
            _dispatchInit(context);
            return RocketsLoadingView();
          } else if (state is UpcomingLoadingState) {
            return RocketsLoadingView();
          } else if (state is UpcomingLoadedState) {
            return ListView.builder(
              itemCount: state.upcomingList.length,
              itemBuilder: (context, index) {
                return UpcomingListTile(upcoming : state.upcomingList[index]);
              },
            );
          } else if (state is UpcomingErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected error occur");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<UpcomingBloc>(context)..add(GetUpcomingDataListEvent());
  }
}
