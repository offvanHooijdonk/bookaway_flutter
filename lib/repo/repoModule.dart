import 'package:bookaway_flutter/repo/BooksRepo.dart';
import 'package:koin/koin.dart';

final repoModule = Module()
    ..single((scope) => BooksRepo(scope.get()));