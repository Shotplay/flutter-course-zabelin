import 'package:flutter_app/domain/entity/catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(const CatalogState(activeLikesFilter: false));

  void toggleActiveLikesFilter() {
    emit(state.copyWith(activeLikesFilter: !state.activeLikesFilter));
  }
}
