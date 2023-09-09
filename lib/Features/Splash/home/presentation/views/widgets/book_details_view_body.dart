import 'package:bookly_app/Features/Splash/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/Features/Splash/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BooksDetailsSection(
                  bookModel: bookModel,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
