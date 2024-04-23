part of 'sync_product_bloc.dart';

@freezed
class SyncProductState with _$SyncProductState {
  const factory SyncProductState.initial() = _Initial;
  const factory SyncProductState.loading() = _Loading;
  const factory SyncProductState.success() = _Success;
  const factory SyncProductState.error(String message) = _Error;
  const factory SyncProductState.loaded(ProductResponseModel productResponseModel) = _Loaded;
}
