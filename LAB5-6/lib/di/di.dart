import 'package:laborator_5/di/data_injection.dart';
import 'package:laborator_5/di/domain_injection.dart';

Future initDi() async {
  await initData();
  await initDomain();
}
