// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:sanalira_case/view/bank_view.dart' as _i2;
import 'package:sanalira_case/view/register_view.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RegisterView.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.RegisterView(),
      );
    },
    BankView.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.BankView(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          RegisterView.name,
          path: '/register-view',
        ),
        _i3.RouteConfig(
          BankView.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.RegisterView]
class RegisterView extends _i3.PageRouteInfo<void> {
  const RegisterView()
      : super(
          RegisterView.name,
          path: '/register-view',
        );

  static const String name = 'RegisterView';
}

/// generated route for
/// [_i2.BankView]
class BankView extends _i3.PageRouteInfo<void> {
  const BankView()
      : super(
          BankView.name,
          path: '/',
        );

  static const String name = 'BankView';
}
