import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Splash/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturesBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturesBooks();
    result.fold((Failure) {
      emit(FeaturedBooksFailure(Failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
