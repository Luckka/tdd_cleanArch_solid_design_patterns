import 'package:clean_arch/domain/entities/account_entity.dart';
import 'package:flutter/material.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
   @required String email,
   @required String password
  });
}