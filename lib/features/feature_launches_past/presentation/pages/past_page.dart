import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/loadings/rockets_loading_view.dart';
import 'package:space_x/features/feature_launches_past/presentation/bloc/past_bloc.dart';
import 'package:space_x/features/feature_launches_past/presentation/widgets/past_list_tile_widget.dart';

import '../../../../injection_container.dart';

class PastPage extends StatefulWidget {
  const PastPage({Key? key}) : super(key: key);

  @override
  _PastPageState createState() => _PastPageState();
}

class _PastPageState extends State<PastPage> {
  final bloc = sl<PastBloc>();
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
  BlocProvider<PastBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<PastBloc, PastState>(
        builder: (context, state) {
          if (state is PastInitialState) {
            _dispatchInit(context);
            return RocketsLoadingView();
          } else if (state is PastLoadingState) {
            return RocketsLoadingView();
          } else if (state is PastLoadedState) {
            return ListView.builder(
              itemCount: state.PastList.length,
              itemBuilder: (context, index) {
                return PastListTile(past: state.PastList[index],);
              },
            );
          } else if (state is PastErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected error occur");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<PastBloc>(context)..add(GetPastDataListEvent());
  }
}
