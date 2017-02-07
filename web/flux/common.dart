// Copyright (c) 2017, Paul David Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:js';

typedef void Action<T>(T value);

void jsAlert(var object) {
  context.callMethod('alert', [object]);
}

void jsLog(var object){
  context["console"].callMethod('log', [object]);
}