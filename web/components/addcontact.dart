// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:over_react/over_react.dart';

import 'textinput.dart';

import '../stores.dart';
import '../actions.dart';

@Factory()
UiFactory<AddContactProps> AddContact;

@Props()
class AddContactProps extends FluxUiProps<AddContactActions, AddContactStore> {}

@State()
class AddContactState extends UiState {
  String title;  
  String firstName;
  String surname;  
}

@Component()
class AddContactComponent 
    extends FluxUiStatefulComponent<AddContactProps, AddContactState> {
  getDefaultProps() => (newProps());

  @override
  getInitialState() => (newState()
    ..title = ""
    ..firstName = ""
    ..surname = "");
   
  @override
  render() {
    if (state == null) 
      return (Dom.div())("Loading. Please wait...");

    return (Dom.div())(
        (TextInput()
          ..labelText = "Title"
          ..placeholderText = "Please enter..."
          ..content = state.title
          ..onChange = (String s) => setState(newState()..title = s))(),
        (TextInput()
          ..labelText = "First name"
          ..placeholderText = "Please enter..."
          ..content = state.firstName
          ..onChange = (String s) => setState(newState()..firstName = s))(),
        (TextInput()
          ..labelText = "Surname"
          ..placeholderText = "Please enter..."
          ..content = state.surname          
          ..onChange = (String s) => setState(newState()..surname = s))(),
        (Dom.input()
          ..type = "submit"
          ..value = "Submit"
          ..onClick = _onSubmit)          
          ()
        );       
  }

  _onSubmit(event) {
    props.actions.submitContact(new Contact(state.title, state.firstName, state.surname));
  }
}