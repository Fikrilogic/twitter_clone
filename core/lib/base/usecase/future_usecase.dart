import 'dart:developer';

import 'package:core/base/usecase/base_usecase.dart';

abstract class FutureUseCase<Input, Output> extends BaseUseCase<Input, Future<Output>>{
  const FutureUseCase();

  Future<Output> execute(Input input) async{
    try {
      final output = buildUseCase(input);
      return output;
    } catch(e){
      log('error');
      log(e.toString());
      rethrow;
    }
  }
}