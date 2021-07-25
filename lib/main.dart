import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart'; // NEW

import 'app.dart';
import 'domain/model/app_state_model.dart'; // NEW

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      // NEW
      create: (_) => AppStateModel()..init(), // NEW
      child: CupertinoStoreApp(), // NEW
    ),
  );
}
