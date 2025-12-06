import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userLogin = userLogin,
       _currentUser = currentUser,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {
    on<AuthEvent>((_, emit) => AuthLoading());
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (failure) {
        debugPrint('[API Response] (IsLoggedId) Failure : ${failure.message}');
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint('[API Response] (IsLoggedId) User Id : ${user.id}');
        debugPrint('[API Response] (IsLoggedId) User Name : ${user.name}');
        debugPrint('[API Response] (IsLoggedId) User Email : ${user.email}');
        _emitAuthSuccess(user, emit);
      },
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) {
        debugPrint('[API Response] (Register) Failure : ${failure.message}');
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint('[API Response] (Register) User Id : ${user.id}');
        debugPrint('[API Response] (Register) User Name : ${user.name}');
        debugPrint('[API Response] (Register) User Email : ${user.email}');
        _emitAuthSuccess(user, emit);
      },
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final res = await _userLogin(
      UserLoginParams(email: event.email, password: event.password),
    );

    res.fold(
      (failure) {
        debugPrint('[API Response] (Login) Failure : ${failure.message}');
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint('[API Response] (Login) User Id : ${user.id}');
        debugPrint('[API Response] (Login) User Name : ${user.name}');
        debugPrint('[API Response] (Login) User Email : ${user.email}');
        _emitAuthSuccess(user, emit);
      },
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final UserSignUp _userSignUp;

//   AuthBloc({required UserSignUp userSignUp})
//     : _userSignUp = userSignUp,
//       super(AuthInitial()) {
//     on<AuthSignUp>((event, emit) async {
//       debugPrint('AuthSignUp event received');

//       debugPrint(
//         'SignUp Params:\n'
//         'name: ${event.name}\n'
//         'email: ${event.email}\n'
//         'password: (hidden)',
//       );

//       final res = await _userSignUp(
//         UserSignUpParams(
//           name: event.name,
//           email: event.email,
//           password: event.password,
//         ),
//       );

//       res.fold(
//         (failure) {
//           debugPrint('SignUp Failed: ${failure.message}');
//           emit(AuthFailure(failure.message));
//         },
//         (uid) {
//           debugPrint('SignUp Success: UID -> $uid');
//           emit(AuthSuccess(User));
//         },
//       );
//     });
//   }
// }
