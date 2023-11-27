import 'package:async/async.dart';
import 'package:core/core.dart';

abstract class Config{

  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer();

  FutureVoid config();
  FutureVoid init() => _asyncMemoizer.runOnce(config);
}