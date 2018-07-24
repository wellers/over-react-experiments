// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:over_react/over_react.dart';
import 'package:route_hierarchical/client.dart';

import 'header.dart';

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
    return Dom.div()(
      (Header()..router = props.router)(),
      Dom.div()("This application has been built using Workiva's DartReact.")
      );
  }
}