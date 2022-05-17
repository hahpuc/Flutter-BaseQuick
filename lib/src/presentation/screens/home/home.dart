import 'dart:developer';

import 'package:base_quick/src/core/theme/app_dimens.dart';
import 'package:base_quick/src/data/models/response/users/users_response.dart';
import 'package:base_quick/src/presentation/widgets/base/custom_network_image.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  // Page
  var pageKey = 1;
  var _pagingController = PagingController<int, UserModel>(firstPageKey: 1);

  @override
  void afterFirstFrame(BuildContext context) {}

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      log("-----> Add Page Request Listener $pageKey");

      _userCubit.getUserList(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void userListener(BuildContext context, UserState state) {
    if (state is UserGetListState) {
      setState(() {
        pageKey++;
      });

      if (pageKey > state.data.totalPages!) {
        _pagingController.appendLastPage(state.data.data!);
      } else {
        _pagingController.appendPage(state.data.data!, pageKey);
      }
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
        child: PagedListView<int, UserModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<UserModel>(
              itemBuilder: (context, item, index) {
            return InkWell(
              onTap: _onUserTap,
              child: Container(
                margin: const EdgeInsets.all(AppDimens.spacing_1),
                color: Colors.pink.withOpacity(0.5),
                height: AppDimens.itemHeightLarge,
                child: Row(
                  children: [
                    // Avatar
                    SizedBox(
                      height: AppDimens.imageSize,
                      width: AppDimens.imageSize,
                      child: CustomNetworkImage(
                          imageUrl: item.avatar ?? '', fit: BoxFit.fill),
                    ),

                    // Name
                    Text("${item.firstName} ${item.lastName}"),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _onUserTap() {
    Navigator.pushNamed(context, RoutePaths.demo);
  }
}
