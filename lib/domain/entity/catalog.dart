import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';

@freezed
sealed class CatalogState with _$CatalogState {
  const factory CatalogState({
    required bool activeLikesFilter,
  }) = _CatalogState; 
}