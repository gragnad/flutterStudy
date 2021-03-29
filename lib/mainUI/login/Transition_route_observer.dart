import 'package:flutter/material.dart';

class TransitionRouteObserver<R extends TransitionRoute<dynamic>>
    extends NavigatorObserver {
  final Map<R, Set<TransitionRouteAware>> _listeners =
      <R, Set<TransitionRouteAware>>{};

  void subscribe(TransitionRouteAware routeAware, R route) {
    assert(routeAware != null);
    assert(route != null);
    final subscribers =
        _listeners.putIfAbsent(route, () => <TransitionRouteAware>{});
    if(subscribers.add(routeAware)) {
      routeAware.didPush();
      Future.delayed(route.transitionDuration, () {
        routeAware.didPushAfterTransition();
      });
    }
  }

  ///Unsubscribe [routeAware]
  ///
  /// [routeAware] is no logger informed about changes to its route. If the given argument was
  /// subscribed to multiple types, this will unregister it (once) from each type.
  void unsubscribe(TransitionRouteAware routeAware) {
    assert(routeAware != null);
    for(var route in _listeners.keys) {
      final subscribers = _listeners[route];
      subscribers?.remove(routeAware);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final previousSubscribers = _listeners[previousRoute]?.toList();

      if (previousSubscribers != null) {
        for (var routeAware in previousSubscribers) {
          routeAware.didPopNext();
        }
      }

      final subscribers = _listeners[route]?.toList();

      if (subscribers != null) {
        for (var routeAware in subscribers) {
          routeAware.didPop();
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final previousSubscribers = _listeners[previousRoute];

      if (previousSubscribers != null) {
        for (var routeAware in previousSubscribers) {
          routeAware.didPushNext();
        }
      }
    }
  }
}




/// An interface for objects that aware of their currnet [TransitionRoute].
///
/// his is used with [TransitionRouteObserver] to make a widget aware of changes to the
/// [Navigator]'s session history
abstract class TransitionRouteAware {
  ///called when the top route has been popped off, and the current route
  ///shows up.
  void didPopNext() {}

  /// Called when the current route has been pushed.
  void didPush() {}

  ///Called when the current route has been pushed and finished transition.
  void didPushAfterTransition() {}

  ///Called when the current route has been popped off.
  void didPop() {}

  ///Called when a new route has been pushed, and the current route is no
  ///logger visible
  void didPushNext() {}
}

