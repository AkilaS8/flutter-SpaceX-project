import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_next_lunch/presentation/bloc/next_bloc.dart';

import '../../../injection_container.dart';
import 'next_launch_list_tile_home.dart';

class NextLaunchSection extends StatefulWidget {
  const NextLaunchSection({Key? key}) : super(key: key);

  @override
  _NextLaunchSectionState createState() => _NextLaunchSectionState();
}

class _NextLaunchSectionState extends State<NextLaunchSection> {
  final bloc = sl<NextBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: buildBody(),
      ),
    );
  }

  BlocProvider<NextBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<NextBloc, NextState>(
        builder: (context, state) {
          if (state is NextInitialState) {
            _dispatchInit(context);
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kAppbarColor),
              ),
            );
          } else if (state is NextLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kAppbarColor),
              ),
            );
          } else if (state is NextLoadedState) {
            return NextLaunchListTileHome(
              next: state.NextList,
            );
          } else if (state is NextErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected error occur");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<NextBloc>(context)..add(GetNextDataListEvent());
  }
}
