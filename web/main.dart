// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

import 'actions.dart';
import 'stores.dart';
import 'components/addcontact.dart';
import 'components/viewcontacts.dart';

main() async {    
  // AddContactActions addContactActions = new AddContactActions();
  // AddContactStore addContactStore = new AddContactStore(addContactActions);

  // ReactElement addcontact() => Dom.div()((AddContact()
  //   ..actions = addContactActions
  //   ..store = addContactStore)());
  
  ViewContactsActions viewContactsActions = new ViewContactsActions();
  ViewContactsStore viewContactsStore = new ViewContactsStore(viewContactsActions);

  ReactElement viewcontacts() => Dom.div()((ViewContacts()
    ..actions = viewContactsActions
    ..store = viewContactsStore)());

  // Initialize React within our Dart app
  setClientConfiguration();
  //react_dom.render(addcontact(), querySelector('#react_mount_point'));
  react_dom.render(viewcontacts(), querySelector('#react_mount_point'));
}
