import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color : Colors.white,
  ),
  fillColor: Colors.lightBlueAccent,
  filled: true,
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration =  InputDecoration(
  filled: true,
  fillColor: Colors.black,
  hintText: '',
  hintStyle: TextStyle(
    color: Colors.white,
    ),
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          );