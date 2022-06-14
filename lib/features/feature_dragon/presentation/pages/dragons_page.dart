import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/loadings/dragons_loading_view.dart';
import 'package:space_x/features/feature_dragon/presentation/bloc/dragons_bloc.dart';
import 'package:space_x/features/feature_dragon/presentation/widgets/dragon_list_tile_widget.dart';

import '../../../../injection_container.dart';

class DragonsPage extends StatefulWidget {
  const DragonsPage({Key? key}) : super(key: key);

  @override
  _DragonsPageState createState() => _DragonsPageState();
}

class _DragonsPageState extends State<DragonsPage> {
  final bloc = sl<DragonsBloc>();

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

  BlocProvider<DragonsBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<DragonsBloc, DragonsState>(
        builder: (context, state) {
          if (state is DragonsInitialState) {
            _dispatchInit(context);
            return DragonsLoadingView();
          } else if (state is DragonsLoadingState) {
            return DragonsLoadingView();
          } else if (state is DragonsLoadedState) {
            return ListView.builder(
              itemCount: state.dragonsList.length,
              itemBuilder: (context, index) {
                return DragonListTile(dragon: state.dragonsList[index]);
              },
            );
          } else if (state is DragonsErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected error occur");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<DragonsBloc>(context)..add(GetDragonsDataListEvent());
  }
}
