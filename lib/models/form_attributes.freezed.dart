// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormAttributes {

 GlobalKey<ShadFormState> get formKey; TextEditingController get titleController; TextEditingController get descriptionController;
/// Create a copy of FormAttributes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormAttributesCopyWith<FormAttributes> get copyWith => _$FormAttributesCopyWithImpl<FormAttributes>(this as FormAttributes, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormAttributes&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.titleController, titleController) || other.titleController == titleController)&&(identical(other.descriptionController, descriptionController) || other.descriptionController == descriptionController));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,titleController,descriptionController);

@override
String toString() {
  return 'FormAttributes(formKey: $formKey, titleController: $titleController, descriptionController: $descriptionController)';
}


}

/// @nodoc
abstract mixin class $FormAttributesCopyWith<$Res>  {
  factory $FormAttributesCopyWith(FormAttributes value, $Res Function(FormAttributes) _then) = _$FormAttributesCopyWithImpl;
@useResult
$Res call({
 GlobalKey<ShadFormState> formKey, TextEditingController titleController, TextEditingController descriptionController
});




}
/// @nodoc
class _$FormAttributesCopyWithImpl<$Res>
    implements $FormAttributesCopyWith<$Res> {
  _$FormAttributesCopyWithImpl(this._self, this._then);

  final FormAttributes _self;
  final $Res Function(FormAttributes) _then;

/// Create a copy of FormAttributes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? titleController = null,Object? descriptionController = null,}) {
  return _then(_self.copyWith(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<ShadFormState>,titleController: null == titleController ? _self.titleController : titleController // ignore: cast_nullable_to_non_nullable
as TextEditingController,descriptionController: null == descriptionController ? _self.descriptionController : descriptionController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}

}


/// Adds pattern-matching-related methods to [FormAttributes].
extension FormAttributesPatterns on FormAttributes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormAttributes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormAttributes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormAttributes value)  $default,){
final _that = this;
switch (_that) {
case _FormAttributes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormAttributes value)?  $default,){
final _that = this;
switch (_that) {
case _FormAttributes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GlobalKey<ShadFormState> formKey,  TextEditingController titleController,  TextEditingController descriptionController)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormAttributes() when $default != null:
return $default(_that.formKey,_that.titleController,_that.descriptionController);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GlobalKey<ShadFormState> formKey,  TextEditingController titleController,  TextEditingController descriptionController)  $default,) {final _that = this;
switch (_that) {
case _FormAttributes():
return $default(_that.formKey,_that.titleController,_that.descriptionController);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GlobalKey<ShadFormState> formKey,  TextEditingController titleController,  TextEditingController descriptionController)?  $default,) {final _that = this;
switch (_that) {
case _FormAttributes() when $default != null:
return $default(_that.formKey,_that.titleController,_that.descriptionController);case _:
  return null;

}
}

}

/// @nodoc


class _FormAttributes implements FormAttributes {
  const _FormAttributes({required this.formKey, required this.titleController, required this.descriptionController});
  

@override final  GlobalKey<ShadFormState> formKey;
@override final  TextEditingController titleController;
@override final  TextEditingController descriptionController;

/// Create a copy of FormAttributes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormAttributesCopyWith<_FormAttributes> get copyWith => __$FormAttributesCopyWithImpl<_FormAttributes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormAttributes&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.titleController, titleController) || other.titleController == titleController)&&(identical(other.descriptionController, descriptionController) || other.descriptionController == descriptionController));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,titleController,descriptionController);

@override
String toString() {
  return 'FormAttributes(formKey: $formKey, titleController: $titleController, descriptionController: $descriptionController)';
}


}

/// @nodoc
abstract mixin class _$FormAttributesCopyWith<$Res> implements $FormAttributesCopyWith<$Res> {
  factory _$FormAttributesCopyWith(_FormAttributes value, $Res Function(_FormAttributes) _then) = __$FormAttributesCopyWithImpl;
@override @useResult
$Res call({
 GlobalKey<ShadFormState> formKey, TextEditingController titleController, TextEditingController descriptionController
});




}
/// @nodoc
class __$FormAttributesCopyWithImpl<$Res>
    implements _$FormAttributesCopyWith<$Res> {
  __$FormAttributesCopyWithImpl(this._self, this._then);

  final _FormAttributes _self;
  final $Res Function(_FormAttributes) _then;

/// Create a copy of FormAttributes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formKey = null,Object? titleController = null,Object? descriptionController = null,}) {
  return _then(_FormAttributes(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<ShadFormState>,titleController: null == titleController ? _self.titleController : titleController // ignore: cast_nullable_to_non_nullable
as TextEditingController,descriptionController: null == descriptionController ? _self.descriptionController : descriptionController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}


}

// dart format on
