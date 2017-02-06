// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:over_react/over_react.dart';

@Factory()
UiFactory<MyCustomProps> MyCustomComponentFactory;

@Props()
class MyCustomProps extends FluxUiProps {
  int waitTimeInSeconds;
  String completeMessage;
  String defaultContent;  
}

@State()
class MyCustomState extends UiState {
  String message;
  String contentValue;
}

@Component()
class MyCustomComponent 
  extends FluxUiStatefulComponent<MyCustomProps, MyCustomState> {
    
  @override
  Map getDefaultProps() => (newProps()
  ..waitTimeInSeconds = 0
  ..completeMessage = ""
  ..defaultContent = "");

  @override
  Map getInitialState() => (newState()
    ..message = ""
    ..contentValue = props.defaultContent
  );

  @override
  render() {
    if (state == null) {
      return (Dom.div())("Loading. Please wait...");
    }

    return (Dom.div())(
        (Dom.p())(state.message),
        (Dom.a()
          ..id = "MyLink"
          ..href = "#"
          ..onClick = (e) {
            e.preventDefault();
            setState(newState()
            ..message = "You just clicked the link!"
            ..contentValue = state.contentValue);
          }
          ..onMouseOver = (e) {
            e.preventDefault();
            setState(newState()
            ..message = "Hover!"
            ..contentValue = state.contentValue);
          }
        )("Click me!"),
        (Dom.div())(
          "This is a stateful input: ",
          (Dom.input()
            ..type = "text"
            ..value = state.contentValue
            ..onChange = (e) {              
              setState(newState()
              ..message = state.message
              ..contentValue = (e.currentTarget as InputElement).value);
            })()
          )
      );
    }
}