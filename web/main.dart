// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

import 'flux/dispatcher.dart';
import 'flux/actions.dart';
import 'flux/stores.dart';
import 'flux/addcontact.dart';

// import 'components/mycustomcomponent.dart';

// ReactElement test() => Dom.div()(
//   (MyCustomComponentFactory()
//   ..waitTimeInSeconds = 10
//   ..completeMessage = ""
//   ..defaultContent = "")());

ReactElement addcontact(d, s) => Dom.div()(
 (AddContactFactory()
 ..dispatcher = d
 ..store = s)());

main() {
  // Initialize React within our Dart app
  setClientConfiguration();
  
  // Mount / render your component. 
  // react_dom.render(test(), querySelector('#react_mount_point'));

  var dispatcher = new AppDispatcher();
  var store = new AddContactStore(dispatcher);

  react_dom.render(addcontact(dispatcher, store), querySelector('#react_mount_point'));
  dispatcher.handleServerAction(new StoreInitialised());
}