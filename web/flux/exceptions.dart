// Copyright (c) 2017, Paul David Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class ArgumentException extends StateError {
  ArgumentException(String msg) : super(msg);
}

class ArgumentNullException extends StateError {
  ArgumentNullException(String msg) : super(msg);
}

class ArgumentOutOfRangeException extends StateError {
  ArgumentOutOfRangeException(String msg) : super(msg);
}