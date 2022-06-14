import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_home/widgets/upcoming_list_tile_home.dart';
import 'package:space_x/features/feature_launches_upcoming/presentation/bloc/upcoming_bloc.dart';

import '../../../injection_container.dart';

class UpcomingSection extends StatefulWidget {
  const UpcomingSection({Key? key}) : super(key: key);

  @override
  _UpcomingSectionState createState() => _UpcomingSectionState();
}

class _UpcomingSectionState extends State<UpcomingSection> {
  final bloc = sl<UpcomingBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kAppbarColor),
              ),
            );
          } else if (state is UpcomingLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kAppbarColor),
              ),
            );
          } else if (state is UpcomingLoadedState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.upcomingList.length,
              itemBuilder: (context, index) {
                return UpcomingHomeListTile(
                    upcoming: state.upcomingList[index]);
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
