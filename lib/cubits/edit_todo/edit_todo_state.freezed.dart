// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditTodoState {

 EditTodoStatus get status; Todo? get todo;
/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTodoStateCopyWith<EditTodoState> get copyWith => _$EditTodoStateCopyWithImpl<EditTodoState>(this as EditTodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTodoState&&(identical(other.status, status) || other.status == status)&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,status,todo);

@override
String toString() {
  return 'EditTodoState(status: $status, todo: $todo)';
}


}

/// @nodoc
abstract mixin class $EditTodoStateCopyWith<$Res>  {
  factory $EditTodoStateCopyWith(EditTodoState value, $Res Function(EditTodoState) _then) = _$EditTodoStateCopyWithImpl;
@useResult
$Res call({
 EditTodoStatus status, Todo? todo
});


$TodoCopyWith<$Res>? get todo;

}
/// @nodoc
class _$EditTodoStateCopyWithImpl<$Res>
    implements $EditTodoStateCopyWith<$Res> {
  _$EditTodoStateCopyWithImpl(this._self, this._then);

  final EditTodoState _self;
  final $Res Function(EditTodoState) _then;

/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? todo = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditTodoStatus,todo: freezed == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo?,
  ));
}
/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoCopyWith<$Res>? get todo {
    if (_self.todo == null) {
    return null;
  }

  return $TodoCopyWith<$Res>(_self.todo!, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditTodoState].
extension EditTodoStatePatterns on EditTodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditTodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditTodoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditTodoState value)  $default,){
final _that = this;
switch (_that) {
case _EditTodoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditTodoState value)?  $default,){
final _that = this;
switch (_that) {
case _EditTodoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditTodoStatus status,  Todo? todo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditTodoState() when $default != null:
return $default(_that.status,_that.todo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditTodoStatus status,  Todo? todo)  $default,) {final _that = this;
switch (_that) {
case _EditTodoState():
return $default(_that.status,_that.todo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditTodoStatus status,  Todo? todo)?  $default,) {final _that = this;
switch (_that) {
case _EditTodoState() when $default != null:
return $default(_that.status,_that.todo);case _:
  return null;

}
}

}

/// @nodoc


class _EditTodoState implements EditTodoState {
  const _EditTodoState({this.status = EditTodoStatus.initial, this.todo});
  

@override@JsonKey() final  EditTodoStatus status;
@override final  Todo? todo;

/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditTodoStateCopyWith<_EditTodoState> get copyWith => __$EditTodoStateCopyWithImpl<_EditTodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditTodoState&&(identical(other.status, status) || other.status == status)&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,status,todo);

@override
String toString() {
  return 'EditTodoState(status: $status, todo: $todo)';
}


}

/// @nodoc
abstract mixin class _$EditTodoStateCopyWith<$Res> implements $EditTodoStateCopyWith<$Res> {
  factory _$EditTodoStateCopyWith(_EditTodoState value, $Res Function(_EditTodoState) _then) = __$EditTodoStateCopyWithImpl;
@override @useResult
$Res call({
 EditTodoStatus status, Todo? todo
});


@override $TodoCopyWith<$Res>? get todo;

}
/// @nodoc
class __$EditTodoStateCopyWithImpl<$Res>
    implements _$EditTodoStateCopyWith<$Res> {
  __$EditTodoStateCopyWithImpl(this._self, this._then);

  final _EditTodoState _self;
  final $Res Function(_EditTodoState) _then;

/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? todo = freezed,}) {
  return _then(_EditTodoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditTodoStatus,todo: freezed == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo?,
  ));
}

/// Create a copy of EditTodoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoCopyWith<$Res>? get todo {
    if (_self.todo == null) {
    return null;
  }

  return $TodoCopyWith<$Res>(_self.todo!, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

// dart format on
