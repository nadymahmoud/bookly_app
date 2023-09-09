import 'package:bookly_app/Features/Splash/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturesBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String categery});
}