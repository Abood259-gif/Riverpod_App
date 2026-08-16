// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  authInitial,TResult Function( AuthLoading value)?  authLoading,TResult Function( EmailCheckSuccess value)?  emailCheckSuccess,TResult Function( AuthAuthenticated value)?  authAuthenticated,TResult Function( AuthUnauthenticated value)?  authUnauthenticated,TResult Function( AuthFailure value)?  authFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when authInitial != null:
return authInitial(_that);case AuthLoading() when authLoading != null:
return authLoading(_that);case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that);case AuthAuthenticated() when authAuthenticated != null:
return authAuthenticated(_that);case AuthUnauthenticated() when authUnauthenticated != null:
return authUnauthenticated(_that);case AuthFailure() when authFailure != null:
return authFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  authInitial,required TResult Function( AuthLoading value)  authLoading,required TResult Function( EmailCheckSuccess value)  emailCheckSuccess,required TResult Function( AuthAuthenticated value)  authAuthenticated,required TResult Function( AuthUnauthenticated value)  authUnauthenticated,required TResult Function( AuthFailure value)  authFailure,}){
final _that = this;
switch (_that) {
case AuthInitial():
return authInitial(_that);case AuthLoading():
return authLoading(_that);case EmailCheckSuccess():
return emailCheckSuccess(_that);case AuthAuthenticated():
return authAuthenticated(_that);case AuthUnauthenticated():
return authUnauthenticated(_that);case AuthFailure():
return authFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  authInitial,TResult? Function( AuthLoading value)?  authLoading,TResult? Function( EmailCheckSuccess value)?  emailCheckSuccess,TResult? Function( AuthAuthenticated value)?  authAuthenticated,TResult? Function( AuthUnauthenticated value)?  authUnauthenticated,TResult? Function( AuthFailure value)?  authFailure,}){
final _that = this;
switch (_that) {
case AuthInitial() when authInitial != null:
return authInitial(_that);case AuthLoading() when authLoading != null:
return authLoading(_that);case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that);case AuthAuthenticated() when authAuthenticated != null:
return authAuthenticated(_that);case AuthUnauthenticated() when authUnauthenticated != null:
return authUnauthenticated(_that);case AuthFailure() when authFailure != null:
return authFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authInitial,TResult Function()?  authLoading,TResult Function( String email,  bool isAvailable)?  emailCheckSuccess,TResult Function( UserModel user)?  authAuthenticated,TResult Function()?  authUnauthenticated,TResult Function( String errorMessage)?  authFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when authInitial != null:
return authInitial();case AuthLoading() when authLoading != null:
return authLoading();case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that.email,_that.isAvailable);case AuthAuthenticated() when authAuthenticated != null:
return authAuthenticated(_that.user);case AuthUnauthenticated() when authUnauthenticated != null:
return authUnauthenticated();case AuthFailure() when authFailure != null:
return authFailure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authInitial,required TResult Function()  authLoading,required TResult Function( String email,  bool isAvailable)  emailCheckSuccess,required TResult Function( UserModel user)  authAuthenticated,required TResult Function()  authUnauthenticated,required TResult Function( String errorMessage)  authFailure,}) {final _that = this;
switch (_that) {
case AuthInitial():
return authInitial();case AuthLoading():
return authLoading();case EmailCheckSuccess():
return emailCheckSuccess(_that.email,_that.isAvailable);case AuthAuthenticated():
return authAuthenticated(_that.user);case AuthUnauthenticated():
return authUnauthenticated();case AuthFailure():
return authFailure(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authInitial,TResult? Function()?  authLoading,TResult? Function( String email,  bool isAvailable)?  emailCheckSuccess,TResult? Function( UserModel user)?  authAuthenticated,TResult? Function()?  authUnauthenticated,TResult? Function( String errorMessage)?  authFailure,}) {final _that = this;
switch (_that) {
case AuthInitial() when authInitial != null:
return authInitial();case AuthLoading() when authLoading != null:
return authLoading();case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that.email,_that.isAvailable);case AuthAuthenticated() when authAuthenticated != null:
return authAuthenticated(_that.user);case AuthUnauthenticated() when authUnauthenticated != null:
return authUnauthenticated();case AuthFailure() when authFailure != null:
return authFailure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authInitial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authLoading()';
}


}




/// @nodoc


class EmailCheckSuccess implements AuthState {
  const EmailCheckSuccess({required this.email, required this.isAvailable});
  

 final  String email;
 final  bool isAvailable;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailCheckSuccessCopyWith<EmailCheckSuccess> get copyWith => _$EmailCheckSuccessCopyWithImpl<EmailCheckSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckSuccess&&(identical(other.email, email) || other.email == email)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,email,isAvailable);

@override
String toString() {
  return 'AuthState.emailCheckSuccess(email: $email, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $EmailCheckSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $EmailCheckSuccessCopyWith(EmailCheckSuccess value, $Res Function(EmailCheckSuccess) _then) = _$EmailCheckSuccessCopyWithImpl;
@useResult
$Res call({
 String email, bool isAvailable
});




}
/// @nodoc
class _$EmailCheckSuccessCopyWithImpl<$Res>
    implements $EmailCheckSuccessCopyWith<$Res> {
  _$EmailCheckSuccessCopyWithImpl(this._self, this._then);

  final EmailCheckSuccess _self;
  final $Res Function(EmailCheckSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? isAvailable = null,}) {
  return _then(EmailCheckSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AuthAuthenticated implements AuthState {
  const AuthAuthenticated(this.user);
  

 final  UserModel user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authAuthenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthAuthenticated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthUnauthenticated implements AuthState {
  const AuthUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authUnauthenticated()';
}


}




/// @nodoc


class AuthFailure implements AuthState {
  const AuthFailure(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'AuthState.authFailure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(AuthFailure(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
