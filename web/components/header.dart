// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';
import 'package:route_hierarchical/client.dart';

@Factory()
UiFactory<HeaderProps> Header;

@Props()
class HeaderProps extends UiProps {
  Router router;
}

@Component()
class HeaderCompenent 
    extends UiComponent<HeaderProps> {
  
  @override
  render() {
    return (Dom.div()..className = "header"
      )(
        (Dom.h1())("OverReact Experiments!"), 
        (Dom.a()
          ..href = ""
          ..onClick = _navigateHome
          )("Home"),
        " ",
        (Dom.a()
          ..href = ""
          ..onClick = _navigateShowViewContacts
          )("View Contacts"),
        " ",
        (Dom.a()
          ..href = ""
          ..onClick = _navigateContactAdd
          )("Add New Contact"),
        (Dom.br()()),
        (Dom.br()())
    );
  }

  _navigateHome(react.SyntheticMouseEvent ev) {
    props.router.go("home", {}); 
  }

  _navigateShowViewContacts(react.SyntheticMouseEvent ev) {
    props.router.go("showViewContacts", {}); 
  }

  _navigateContactAdd(react.SyntheticMouseEvent ev) {
    props.router.go("contact.add", {});
  }
}