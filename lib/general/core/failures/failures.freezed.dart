// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainFailure {

 String get errorMsg;
/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainFailureCopyWith<MainFailure> get copyWith => _$MainFailureCopyWithImpl<MainFailure>(this as MainFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainFailure&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $MainFailureCopyWith<$Res>  {
  factory $MainFailureCopyWith(MainFailure value, $Res Function(MainFailure) _then) = _$MainFailureCopyWithImpl;
@useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$MainFailureCopyWithImpl<$Res>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._self, this._then);

  final MainFailure _self;
  final $Res Function(MainFailure) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMsg = null,}) {
  return _then(_self.copyWith(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MainFailure].
extension MainFailurePatterns on MainFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerFailure value)?  serverFailure,TResult Function( _GeneralFailure value)?  generalFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that);case _GeneralFailure() when generalFailure != null:
return generalFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerFailure value)  serverFailure,required TResult Function( _GeneralFailure value)  generalFailure,}){
final _that = this;
switch (_that) {
case ServerFailure():
return serverFailure(_that);case _GeneralFailure():
return generalFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerFailure value)?  serverFailure,TResult? Function( _GeneralFailure value)?  generalFailure,}){
final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that);case _GeneralFailure() when generalFailure != null:
return generalFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String errorMsg)?  serverFailure,TResult Function( String errorMsg)?  generalFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that.errorMsg);case _GeneralFailure() when generalFailure != null:
return generalFailure(_that.errorMsg);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String errorMsg)  serverFailure,required TResult Function( String errorMsg)  generalFailure,}) {final _that = this;
switch (_that) {
case ServerFailure():
return serverFailure(_that.errorMsg);case _GeneralFailure():
return generalFailure(_that.errorMsg);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String errorMsg)?  serverFailure,TResult? Function( String errorMsg)?  generalFailure,}) {final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that.errorMsg);case _GeneralFailure() when generalFailure != null:
return generalFailure(_that.errorMsg);case _:
  return null;

}
}

}

/// @nodoc


class ServerFailure implements MainFailure {
  const ServerFailure({required this.errorMsg});
  

@override final  String errorMsg;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure.serverFailure(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(ServerFailure(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GeneralFailure implements MainFailure {
  const _GeneralFailure({required this.errorMsg});
  

@override final  String errorMsg;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralFailureCopyWith<_GeneralFailure> get copyWith => __$GeneralFailureCopyWithImpl<_GeneralFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralFailure&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure.generalFailure(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class _$GeneralFailureCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory _$GeneralFailureCopyWith(_GeneralFailure value, $Res Function(_GeneralFailure) _then) = __$GeneralFailureCopyWithImpl;
@override @useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class __$GeneralFailureCopyWithImpl<$Res>
    implements _$GeneralFailureCopyWith<$Res> {
  __$GeneralFailureCopyWithImpl(this._self, this._then);

  final _GeneralFailure _self;
  final $Res Function(_GeneralFailure) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(_GeneralFailure(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
