// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Onboarding {

 String get imgPath; String get title; String get description;
/// Create a copy of Onboarding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingCopyWith<Onboarding> get copyWith => _$OnboardingCopyWithImpl<Onboarding>(this as Onboarding, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Onboarding&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,imgPath,title,description);

@override
String toString() {
  return 'Onboarding(imgPath: $imgPath, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $OnboardingCopyWith<$Res>  {
  factory $OnboardingCopyWith(Onboarding value, $Res Function(Onboarding) _then) = _$OnboardingCopyWithImpl;
@useResult
$Res call({
 String imgPath, String title, String description
});




}
/// @nodoc
class _$OnboardingCopyWithImpl<$Res>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(this._self, this._then);

  final Onboarding _self;
  final $Res Function(Onboarding) _then;

/// Create a copy of Onboarding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imgPath = null,Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Onboarding].
extension OnboardingPatterns on Onboarding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Onboarding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Onboarding() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Onboarding value)  $default,){
final _that = this;
switch (_that) {
case _Onboarding():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Onboarding value)?  $default,){
final _that = this;
switch (_that) {
case _Onboarding() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imgPath,  String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Onboarding() when $default != null:
return $default(_that.imgPath,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imgPath,  String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _Onboarding():
return $default(_that.imgPath,_that.title,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imgPath,  String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Onboarding() when $default != null:
return $default(_that.imgPath,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _Onboarding implements Onboarding {
  const _Onboarding({required this.imgPath, required this.title, required this.description});
  

@override final  String imgPath;
@override final  String title;
@override final  String description;

/// Create a copy of Onboarding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingCopyWith<_Onboarding> get copyWith => __$OnboardingCopyWithImpl<_Onboarding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Onboarding&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,imgPath,title,description);

@override
String toString() {
  return 'Onboarding(imgPath: $imgPath, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$OnboardingCopyWith<$Res> implements $OnboardingCopyWith<$Res> {
  factory _$OnboardingCopyWith(_Onboarding value, $Res Function(_Onboarding) _then) = __$OnboardingCopyWithImpl;
@override @useResult
$Res call({
 String imgPath, String title, String description
});




}
/// @nodoc
class __$OnboardingCopyWithImpl<$Res>
    implements _$OnboardingCopyWith<$Res> {
  __$OnboardingCopyWithImpl(this._self, this._then);

  final _Onboarding _self;
  final $Res Function(_Onboarding) _then;

/// Create a copy of Onboarding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imgPath = null,Object? title = null,Object? description = null,}) {
  return _then(_Onboarding(
imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
