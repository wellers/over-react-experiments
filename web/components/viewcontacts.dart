// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:over_react/over_react.dart';

import '../stores.dart';
import '../actions.dart';

@Factory()
UiFactory<ViewContactsProps> ViewContacts;

@Props()
class ViewContactsProps extends FluxUiProps<ViewContactsActions, ViewContactsStore> {}

@State()
class ViewContactsState extends UiState {
  List contacts;
}

@Component()
class ViewContactsComponent 
    extends FluxUiStatefulComponent<ViewContactsProps, ViewContactsState> {
  getDefaultProps() => (newProps());

  @override
  getInitialState() => (newState()
    ..contacts = []);
   
  @override
  render() {
    if (state == null) 
      return (Dom.div())("Loading. Please wait...");

    List rows = [];
    var key = 0;
    props.store.contacts.forEach((Contact contact) {
      rows.add((Dom.tr()..key = "contact" + key.toString())(
        (Dom.td())(contact.title),
        (Dom.td())(contact.firstName),
        (Dom.td())(contact.surname)        
      ));
      key++;
    });

    return (Dom.table())(
      (Dom.thead())(
        (Dom.tr())(
          (Dom.th())("Title"),
          (Dom.th())("Firstname"),
          (Dom.th())("Surname")
        )
      ),
      (Dom.tbody())(rows)
    );
  }
}