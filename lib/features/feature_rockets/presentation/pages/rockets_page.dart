import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/loadings/rockets_loading_view.dart';
import 'package:space_x/features/feature_rockets/presentation/bloc/rockets_bloc.dart';
import 'package:space_x/features/feature_rockets/presentation/widgets/rocket_list_tile_widget.dart';
import 'package:space_x/injection_container.dart';

class RocketsPage extends StatefulWidget {
  const RocketsPage({Key? key}) : super(key: key);

  @override
  _RocketsPageState createState() => _RocketsPageState();
}

class _RocketsPageState extends State<RocketsPage> {
  final bloc = sl<RocketsBloc>();

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

  BlocProvider<RocketsBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<RocketsBloc, RocketsState>(
        builder: (context, state) {
          if (state is RocketsInitialState) {
            _dispatchInit(context);
            return RocketsLoadingView();
          } else if (state is RocketsLoadingState) {
            return RocketsLoadingView();
          } else if (state is RocketsLoadedState) {
            return ListView.builder(
              itemCount: state.rocketsList.length,
              itemBuilder: (context, index) {
                return RocketListTile(rocket: state.rocketsList[index]);
              },
            );
          } else if (state is RocketsErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected error occur");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<RocketsBloc>(context)..add(GetRocketDataListEvent());
  }
}
