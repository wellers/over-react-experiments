// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
import 'package:over_react/over_react.dart';
import 'components/mycustomcomponent.dart';


react_client.ReactElement customComponent() => Dom.div()(
 (MyCustomComponentFactory()
 ..waitTimeInSeconds = 10
 ..completeMessage = ""
 ..defaultContent = "")());

main() {
  // Initialize React within our Dart app
  react_client.setClientConfiguration();

  // Mount / render your component. 
  react_dom.render(customComponent(), querySelector('#react_mount_point'));
}