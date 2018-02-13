// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.


import 'package:w_flux/w_flux.dart';

import 'actions.dart';

class AddContactStore extends Store {
  Contact _contact;
  Contact get contact => _contact;

  AddContactActions _actions;

  AddContactStore(AddContactActions this._actions) {
    _contact = new Contact("", "", "");

    triggerOnAction(_actions.submitContact, (Contact newState) { 
      _contact = newState; 
      print("title: " + newState.title + "; firstname: " + newState.firstName + "; surname: " + newState.surname); });
  }  
}

class Contact {
  String title;
  String firstName;
  String surname;

  Contact(String this.title, String this.firstName, String this.surname);
}