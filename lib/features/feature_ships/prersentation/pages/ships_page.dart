import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/loadings/ships_loading_view.dart';
import 'package:space_x/features/feature_ships/prersentation/bloc/ships_bloc.dart';
import 'package:space_x/features/feature_ships/prersentation/widgets/ships_list_tile_widget.dart';

import '../../../../injection_container.dart';

class ShipsPage extends StatefulWidget {
  const ShipsPage({Key? key}) : super(key: key);

  @override
  _ShipsPageState createState() => _ShipsPageState();
}

class _ShipsPageState extends State<ShipsPage> {
  final bloc = sl<ShipsBloc>();

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

  BlocProvider<ShipsBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<ShipsBloc, ShipsState>(
        builder: (context, state) {
          if (state is ShipsInitialState) {
            _dispatchInit(context);
            return ShipsLoadingView();
          } else if (state is ShipsLoadingState) {
            return ShipsLoadingView();
          } else if (state is ShipsLoadedState) {
            return ListView.builder(
              itemCount: state.shipsList.length,
              itemBuilder: (context, index) {
                return ShipListTile(ship: state.shipsList[index]);
              },
            );
          } else if (state is ShipsErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("exception");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<ShipsBloc>(context)..add(GetShipsDataListEvent());
  }
}
