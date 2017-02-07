// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:over_react/over_react.dart';
import 'common.dart';

@Factory()
UiFactory<TextInputProps> TextInputFactory;

@Props()
class TextInputProps extends UiProps {
  String labelText;
  String defaultContent;
  String content;
  Action<String> onChange;
}

@Component()
class TextInput extends UiComponent<TextInputProps> {
  @override
  render() {
    return (Dom.div())(
        (Dom.label())(props.labelText),
        ": ",
        (Dom.input()
          ..type = "text"
          ..value = props.content
          ..onChange = (e) =>
              props.onChange((e.currentTarget as InputElement).value))());
  }
}