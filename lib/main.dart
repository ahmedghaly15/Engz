import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_observer.dart';
import 'core/di/di.dart';
import 'core/utils/functions/check_if_onboarding_is_visited.dart';
import 'core/widgets/flutter_error_details_view.dart';
import 'engz_app.dart';

void main() async {
  // testing deploy workflow
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(dir.path),
  );

  Bloc.observer = MyBlocObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) =>
      FlutterErrorDetailsView(details: details);

  await setupDI();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    checkIfOnboardingIsVisited(),
  ]);

  runApp(const EngzApp());
}
