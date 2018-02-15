// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';
import 'package:route_hierarchical/client.dart';

@Factory()
UiFactory<HomeProps> Home;

@Props()
class HomeProps extends UiProps {
  Router router;
}

@Component()
class HomeComponent 
    extends UiComponent<HomeProps> {

  @override
  render() {
    return (Dom.div()
      )(
        (Dom.h1())("OverReact Experiments!"), 
        (Dom.a()
          ..href = ""
          ..onClick = _navigateShowViewContacts
          )("View Contacts"),
        " ",
        (Dom.a()
          ..href = ""
          ..onClick = _navigateContactAdd
          )("Add New Contact"),
    );
  }

  _navigateShowViewContacts(react.SyntheticMouseEvent ev) {
    props.router.go("showViewContacts", {}); 
  }

  _navigateContactAdd(react.SyntheticMouseEvent ev) {
    props.router.go("contact.add", {});
  }
}