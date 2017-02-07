// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dispatcher.dart';

class StoreInitialised implements IDispatcherAction { }

class EditRequested<T> implements IDispatcherAction {
  T newState;
  EditRequested(this.newState);
}