// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'actions.dart';
import 'dispatcher.dart';
import 'common.dart';

class Contact {
  final String title;
  final String firstName;
  final String surname;

  Contact(this.title, this.firstName, this.surname);
}

class AddContactStore {
  final StreamController controller = new StreamController.broadcast();
  final AppDispatcher dispatcher;
  Contact contact = new Contact("", "", "");

  AddContactStore(this.dispatcher) {
    dispatcher.register((message) {
      if (message.action is StoreInitialised) {
        jsLog('Store Initialised');        
      }
      else if (message.action is EditRequested<Contact>) {
        jsLog('Edit Requested');
        contact = (message.action as EditRequested<Contact>).newState;
      }
      
      // trigger OnChange event 
      controller.add(new Object()); 
    });
  }  
}