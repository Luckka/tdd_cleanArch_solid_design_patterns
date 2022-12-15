import 'package:clean_arch/domain/entities/account_entity.dart';
import 'package:flutter/material.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParms params);
}

class AuthenticationParms {
   final String email;
   final String password;

   AuthenticationParms({
    @required this.email,
    @required this.password
   });

   Map toJson() => {'email': email, 'password': password};
}