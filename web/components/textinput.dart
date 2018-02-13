// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';

@Factory()
UiFactory<TextInputProps> TextInput;

@Props()
class TextInputProps extends UiProps {
  String labelText;
  String content;
  String placeholderText;
  Function onChange;
}

@Component()
class TextInputCompenent 
    extends UiComponent<TextInputProps> {
  
  @override
  render() {
    return (Dom.div())(
        (Dom.label())(props.labelText),
        ": ",
        (Dom.input()          
          ..type = "text"
          ..value = props.content
          ..placeholder = props.placeholderText
          ..onChange = _onChange)());
  }

  _onChange(react.SyntheticFormEvent event){
    props.onChange(event.target.value);
  }
}