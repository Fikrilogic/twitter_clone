import 'package:core/base/usecase/base_usecase.dart';

abstract class StreamUseCase<Input, Output> extends BaseUseCase<Input, Stream<Output>>{

  const StreamUseCase();

  Stream<Output> executed(Input input){
    return buildUseCase(input);
  }
}