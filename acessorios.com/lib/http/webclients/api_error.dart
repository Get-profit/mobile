import 'package:flutter/cupertino.dart';

class ApiError{


  ApiError({this.code,this.message});

  @required final int code;
  @required final String message;
}