// Copyright (c) 2017, Paul David Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dispatcher;

import 'dart:async';

import 'exceptions.dart';
import 'common.dart';

enum MessageSourceOptions { Server, View }

abstract class IDispatcherAction {}

abstract class IMatchDispatcherMessages {}

class DispatcherMessage {
  DispatcherMessage(MessageSourceOptions source, IDispatcherAction action) {
    if ((source != MessageSourceOptions.Server) &&
        (source != MessageSourceOptions.View))
      throw new ArgumentOutOfRangeException("source");
    if (action == null) throw new ArgumentNullException("action");

    _source = source;
    _action = action;
  }

  MessageSourceOptions _source;
  MessageSourceOptions get source => _source;

  IDispatcherAction _action;
  IDispatcherAction get action => _action;
}

class AppDispatcher {
  final StreamController controller = new StreamController.broadcast();

  bool _currentDispatching;
  AppDispatcher() {
    _currentDispatching = false;
  }

  void register(Action<DispatcherMessage> callback) {
    controller.stream.listen(callback);
  }

  void handleViewAction(IDispatcherAction action) {
    if (action == null) throw new ArgumentNullException("action");

    dispatch(new DispatcherMessage(MessageSourceOptions.View, action));
  }

  void handleServerAction(IDispatcherAction action) {
    if (action == null) throw new ArgumentNullException("action");

    dispatch(new DispatcherMessage(MessageSourceOptions.Server, action));
  }

  void dispatch(DispatcherMessage message) {
    if (message == null) throw new ArgumentNullException("message");

    if (controller != null) {
      if (_currentDispatching)
        throw new Exception("Cannot dispatch in the middle of a dispatch.");

      _currentDispatching = true;
      try {
        controller.add(message);
      } finally {
        _currentDispatching = false;
      }
    }
  }
}