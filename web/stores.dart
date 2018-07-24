// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:w_flux/w_flux.dart';
import 'apis.dart';
import 'actions.dart';

class AddContactStore extends Store {
  Contact _contact = new Contact("", "", "");
  Contact get contact => _contact;

  AddContactActions _actions;
  ContactsApi _api;

  AddContactStore(AddContactActions this._actions, ContactsApi this._api) {    
    triggerOnAction(_actions.submitContact, (Contact newState) {   
      _api.contacts.add(newState);     
      _api.contacts.forEach((f) => print(f.title + " " + f.firstName  + " " + f.surname));
      _contact = new Contact("", "", "");
      });
  }  
}

class ViewContactsStore extends Store {  
  List<Contact> get contacts => _api.contacts;

  ViewContactsActions _actions;
  ContactsApi _api;

  ViewContactsStore(ViewContactsActions this._actions, ContactsApi this._api) { }
}