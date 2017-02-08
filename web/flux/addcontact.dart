// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:over_react/over_react.dart';
import 'dispatcher.dart';
import 'stores.dart';
import 'actions.dart';
import 'textinput.dart';

@Factory()
UiFactory<AddContactProps> AddContactFactory;

@Props()
class AddContactProps extends UiProps {
  AppDispatcher dispatcher;
  AddContactStore store;
}

@State()
class AddContactState extends UiState {
  String title;
  String firstName;
  String surname;
}

@Component()
class AddContact 
  extends UiStatefulComponent<AddContactProps, AddContactState> {

  @override
  Map getInitialState() => (newState()
    ..title = ""
    ..firstName = ""
    ..surname = "");

  @override
  void componentDidMount() {
    props.store.controller.stream.listen((Object o) => storeChanged());
    storeChanged();
  }

  void storeChanged() {
    setState(newState()
      ..title = props.store.contact.title
      ..firstName = props.store.contact.firstName
      ..surname = props.store.contact.surname);
  }

  @override
  render() {
    if (state == null) return (Dom.div())("Loading. Please wait...");

    return (Dom.div())(
        (TextInputFactory()
          ..labelText = "Title"
          ..defaultContent = "1"
          ..content = state.title
          ..onChange = (String s) => onChange(new Contact(s, state.firstName, state.surname)))(),
        (TextInputFactory()
          ..labelText = "First name"
          ..defaultContent = "2"
          ..content = state.firstName
          ..onChange = (String s) => onChange(new Contact(state.title, s, state.surname)))(),
        (TextInputFactory()
          ..labelText = "Surname"
          ..defaultContent = "3"
          ..content = state.surname          
          ..onChange = (String s) => onChange(new Contact(state.title, state.firstName, s)))()
          );         
  }

  void onChange(Contact c) {
    props.dispatcher.handleViewAction(new EditRequested<Contact>(c));
  }
}
