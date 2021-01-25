import 'package:bookaway_flutter/dao/BookDao.dart';
import 'package:bookaway_flutter/dao/DBHelper.dart';
import 'package:koin/koin.dart';

final daoModule = Module()
  ..single((scope) => DBHelper())
  ..single((scope) => BookDao(scope.get<DBHelper>().getDatabase()));
