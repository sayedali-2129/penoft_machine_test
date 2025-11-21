import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class MainFailure with _$MainFailure {
  const factory MainFailure.serverFailure({required String errorMsg}) =
      ServerFailure;
  const factory MainFailure.generalFailure({required String errorMsg}) =
      _GeneralFailure;
}
