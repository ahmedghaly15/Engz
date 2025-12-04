// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewTodoState {

 NewTodoStatus get status; bool get isSendButtonEnabled; Todo? get todo;
/// Create a copy of NewTodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewTodoStateCopyWith<NewTodoState> get copyWith => _$NewTodoStateCopyWithImpl<NewTodoState>(this as NewTodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewTodoState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSendButtonEnabled, isSendButtonEnabled) || other.isSendButtonEnabled == isSendButtonEnabled)&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSendButtonEnabled,todo);

@override
String toString() {
  return 'NewTodoState(status: $status, isSendButtonEnabled: $isSendButtonEnabled, todo: $todo)';
}


}

/// @nodoc
abstract mixin class $NewTodoStateCopyWith<$Res>  {
  factory $NewTodoStateCopyWith(NewTodoState value, $Res Function(NewTodoState) _then) = _$NewTodoStateCopyWithImpl;
@useResult
$Res call({
 NewTodoStatus status, bool isSendButtonEnabled, Todo? todo
});


$TodoCopyWith<$Res>? get todo;

}
/// @nodoc
class _$NewTodoStateCopyWithImpl<$Res>
    implements $NewTodoStateCopyWith<$Res> {
  _$NewTodoStateCopyWithImpl(this._self, this._then);

  final NewTodoState _self;
  final $Res Function(NewTodoState) _then;

/// Create a copy of NewTodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isSendButtonEnabled = null,Object? todo = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewTodoStatus,isSendButtonEnabled: null == isSendButtonEnabled ? _self.isSendButtonEnabled : isSendButtonEnabled // ignore: cast_nullable_to_non_nullable
as bool,todo: freezed == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo?,
  ));
}
/// Create a copy of NewTodoState
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


/// Adds pattern-matching-related methods to [NewTodoState].
extension NewTodoStatePatterns on NewTodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewTodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewTodoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewTodoState value)  $default,){
final _that = this;
switch (_that) {
case _NewTodoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewTodoState value)?  $default,){
final _that = this;
switch (_that) {
case _NewTodoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NewTodoStatus status,  bool isSendButtonEnabled,  Todo? todo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewTodoState() when $default != null:
return $default(_that.status,_that.isSendButtonEnabled,_that.todo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NewTodoStatus status,  bool isSendButtonEnabled,  Todo? todo)  $default,) {final _that = this;
switch (_that) {
case _NewTodoState():
return $default(_that.status,_that.isSendButtonEnabled,_that.todo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NewTodoStatus status,  bool isSendButtonEnabled,  Todo? todo)?  $default,) {final _that = this;
switch (_that) {
case _NewTodoState() when $default != null:
return $default(_that.status,_that.isSendButtonEnabled,_that.todo);case _:
  return null;

}
}

}

/// @nodoc


class _NewTodoState implements NewTodoState {
  const _NewTodoState({this.status = NewTodoStatus.initial, this.isSendButtonEnabled = false, this.todo});
  

@override@JsonKey() final  NewTodoStatus status;
@override@JsonKey() final  bool isSendButtonEnabled;
@override final  Todo? todo;

/// Create a copy of NewTodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewTodoStateCopyWith<_NewTodoState> get copyWith => __$NewTodoStateCopyWithImpl<_NewTodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewTodoState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSendButtonEnabled, isSendButtonEnabled) || other.isSendButtonEnabled == isSendButtonEnabled)&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSendButtonEnabled,todo);

@override
String toString() {
  return 'NewTodoState(status: $status, isSendButtonEnabled: $isSendButtonEnabled, todo: $todo)';
}


}

/// @nodoc
abstract mixin class _$NewTodoStateCopyWith<$Res> implements $NewTodoStateCopyWith<$Res> {
  factory _$NewTodoStateCopyWith(_NewTodoState value, $Res Function(_NewTodoState) _then) = __$NewTodoStateCopyWithImpl;
@override @useResult
$Res call({
 NewTodoStatus status, bool isSendButtonEnabled, Todo? todo
});


@override $TodoCopyWith<$Res>? get todo;

}
/// @nodoc
class __$NewTodoStateCopyWithImpl<$Res>
    implements _$NewTodoStateCopyWith<$Res> {
  __$NewTodoStateCopyWithImpl(this._self, this._then);

  final _NewTodoState _self;
  final $Res Function(_NewTodoState) _then;

/// Create a copy of NewTodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isSendButtonEnabled = null,Object? todo = freezed,}) {
  return _then(_NewTodoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewTodoStatus,isSendButtonEnabled: null == isSendButtonEnabled ? _self.isSendButtonEnabled : isSendButtonEnabled // ignore: cast_nullable_to_non_nullable
as bool,todo: freezed == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo?,
  ));
}

/// Create a copy of NewTodoState
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
