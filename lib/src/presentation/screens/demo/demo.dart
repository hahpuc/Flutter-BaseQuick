import '/src/core/mixins/after_layout.dart';
import '/src/presentation/blocs/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/mixins/loading_view.dart';
import '../../../injector.dart';
import '../../blocs/user/user_cubit.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with AfterLayoutMixin, LoadingViewMixin {
  // Blocs
  final UserCubit _userCubit = UserCubit(injector.get(), injector.get());

  @override
  void afterFirstFrame(BuildContext context) {
    _userCubit.getUserDetail(23);
  }

  void userListener(BuildContext context, UserState state) {
    if (state is UserLoadingState) {
      showLoading();
    } else {
      dismissLoading();
    }

    if (state is UserGetDetailSuccessState) {
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
        child: Scaffold(
          body: Container(
            color: Colors.blue.withOpacity(0.4),
            child: const Center(
              child: Text('Demo Page'),
            ),
          ),
        ),
      ),
    );
  }
}
