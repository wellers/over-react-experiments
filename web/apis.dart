// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class Contact {
  String title;
  String firstName;
  String surname;

  Contact(String this.title, String this.firstName, String this.surname);
}

class ContactsApi {
  List<Contact> _contacts = [ new Contact("Mr", "John", "Smith") ];
  List<Contact> get contacts => _contacts;
  set contacts(List<Contact> contacts) => _contacts = contacts;
}