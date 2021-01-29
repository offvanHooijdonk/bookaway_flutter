
import 'package:bookaway_flutter/service/TakeBookService.dart';
import 'package:koin/koin.dart';

final serviceModule = Module()
    ..single((scope) => TakeBookService(scope.get()));