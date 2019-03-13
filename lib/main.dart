import 'package:flutter/material.dart';
import 'package:mobile/src/app.dart';
import 'package:mobile/src/di/core_module.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/di/module.dart';
import 'package:mobile/src/di/ui_module.dart';

void main() => runApp(Injector(
      child: App(),
      modules: <Module>[
        CoreModule.create(),
        UiModule.create(),
      ],
    ));
