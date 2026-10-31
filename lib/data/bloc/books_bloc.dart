import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/usecase/book_add_use_case.dart';
import 'package:flutter_app/domain/usecase/book_load_use_case.dart';
import 'package:flutter_app/domain/usecase/books_fetch_use_case.dart';
import 'package:flutter_app/domain/usecase/books_load_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class BooksEvent {
  const BooksEvent();
}

class BooksLoadEvent extends BooksEvent {
  const BooksLoadEvent();
}

class BooksRefreshEvent extends BooksEvent {
  const BooksRefreshEvent();
}

class BooksAddBookEvent extends BooksEvent {
  final Book book;

  const BooksAddBookEvent(this.book);
}

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BookAddUseCase addBook;
  final BooksLoadUseCase booksLoad;
  final BooksFetchUseCase booksFetch;
  final BookLoadUseCase bookLoad;

  BooksBloc({
    required this.addBook,
    required this.booksLoad,
    required this.booksFetch,
    required this.bookLoad,
  }) : super(const BooksInitialState()) {
    on<BooksRefreshEvent>(_onRefreshBooks);
    on<BooksAddBookEvent>(_onAddBook);
    on<BooksLoadEvent>(_onLoadBooks);
  }

  Future<void> _onRefreshBooks(
    BooksRefreshEvent event,
    Emitter<BooksState> emit,
  ) async {
    emit(const BooksLoadingState());
    try {
      emit(BooksLoadedState(await booksFetch()));
    } on Object catch (e) {
      emit(BooksFailureState(e));
    }
  }

  Future<void> _onAddBook(
    BooksAddBookEvent event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksLoadingState());
    try {
      emit(BooksLoadedState(await addBook(event.book)));
    } on Object catch (e) {
      emit(BooksFailureState(e));
    }
  }

  Future<void> _onLoadBooks(
    BooksLoadEvent event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksLoadingState());
    try {
      emit(BooksLoadedState(await booksLoad()));
    } on Object catch (e) {
      emit(BooksFailureState(e));
    }
  }
}
