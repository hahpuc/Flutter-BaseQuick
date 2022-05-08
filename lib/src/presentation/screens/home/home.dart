import '/src/core/routes/routes.dart';

import '/src/core/mixins/after_layout.dart';
import '/src/core/mixins/loading_view.dart';
import '/src/injector.dart';
import '/src/presentation/blocs/user/user_cubit.dart';
import '/src/presentation/blocs/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with LoadingViewMixin, AfterLayoutMixin {
  // Blocs
  final UserCubit _userCubit = UserCubit(injector.get(), injector.get());

  // Variables
  final String content = '';

  @override
  void afterFirstFrame(BuildContext context) {
    _userCubit.getUserList();
  }

  void userListener(BuildContext context, UserState state) {
    if (state is UserLoadingState) {
      showLoading();
    } else {
      dismissLoading();
    }

    if (state is UserGetListState) {
      showSuccess('Get Data Success');
    }

    if (state is UserGetListFailed) {
      showError(state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _userCubit,
      child: BlocListener<UserCubit, UserState>(
        listener: userListener,
        child: Container(
          color: Colors.pink.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(widget.title ?? 'HELLO WORLD'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.demo);
                },
                child: const Text('Go To Demo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
