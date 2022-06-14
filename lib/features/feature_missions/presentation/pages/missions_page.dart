import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_missions/presentation/bloc/missions_bloc.dart';
import 'package:space_x/features/feature_missions/presentation/widgets/missions_list_tile_widget.dart';
import 'package:space_x/core/loadings/rockets_loading_view.dart';
import 'package:space_x/injection_container.dart';

class MissionsPage extends StatefulWidget {
  const MissionsPage({Key? key}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  final bloc = sl<MissionsBloc>();

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

  BlocProvider<MissionsBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child:
          BlocBuilder<MissionsBloc, MissionsState>(builder: (context, state) {
        if (state is MissionsInitialState) {
         // _dispatchedInit(context);
          bloc.add(GetMissionsDataListEvent());
          return RocketsLoadingView();
        } else if (state is MissionsLoadingState) {
          return RocketsLoadingView();
        } else if (state is MissionsLoadedState) {
          return ListView.builder(
              itemCount: state.missionsList.length,
              itemBuilder: (context, index) {
                return MissionsListTile(
                  mission: state.missionsList[index],
                );
              });
        } else if (state is MissionsErrorState) {
          return ErrorWidget(state.errorMessage.toString());
        }
        return ErrorWidget("Unexpected error occurred");
      }),
    );
  }

  // void _dispatchedInit(context) {
  //   BlocProvider.of<MissionsBloc>(context)..add(GetMissionsDataListEvent());
  // }
}
