// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';
import 'package:route_hierarchical/client.dart';

import 'apis.dart';
import 'actions.dart';
import 'stores.dart';
import 'components/home.dart';
import 'components/addcontact.dart';
import 'components/viewcontacts.dart';

Router router = new Router();
ContactsApi contactsApi = new ContactsApi();
ViewContactsActions viewContactsActions = new ViewContactsActions();
AddContactActions addContactActions = new AddContactActions();
ViewContactsStore viewContactsStore = new ViewContactsStore(viewContactsActions, contactsApi);
AddContactStore addContactStore = new AddContactStore(addContactActions, contactsApi);

main() async {    
  router.root
    ..addRoute(
        name: 'showViewContacts',
        path: '/contacts',
        enter: showViewContacts)
    ..addRoute(
        name: 'contact',
        path: '/contact',
        mount: (router) => router
                 ..addRoute(name: 'add', defaultRoute: true, path: '/add', enter: showAddContact))
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);
  router.listen();

  // Initialize React within our Dart app
  setClientConfiguration();
}

void showHome(RouteEvent e) {  
  ReactElement home() => Dom.div()(
    (Home()
      ..router = router
      )()
    );

  react_dom.render(home(), querySelector('#react_mount_point'));
}

void showViewContacts(RouteEvent e) {
  ReactElement viewcontacts() => Dom.div()(
    (ViewContacts()
      ..router = router
      ..actions = viewContactsActions
      ..store = viewContactsStore
      )()
    );

  react_dom.render(viewcontacts(), querySelector('#react_mount_point'));
}

void showAddContact(RouteEvent e) {
  ReactElement addcontact() => Dom.div()(
    (AddContact()
      ..router = router
      ..actions = addContactActions
      ..store = addContactStore
      )()
    );
  
  react_dom.render(addcontact(), querySelector('#react_mount_point'));
}
