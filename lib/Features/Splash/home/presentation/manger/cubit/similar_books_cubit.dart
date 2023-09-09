import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String categary}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(categery: categary);
    result.fold((Failure) {
      emit(SimilarBooksFailure(Failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
