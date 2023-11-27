import 'package:flutter/cupertino.dart';

abstract class BaseUseCase<Input, Output>{
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}