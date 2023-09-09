import 'package:bookly_app/Features/Splash/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/Features/Splash/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/Splash/home/presentation/manger/cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/Presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/Presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KSearchView = '/searchView';

  static const KBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => SearchView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIT.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
