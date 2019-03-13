import 'package:flutter/material.dart';
import 'package:soulbook/src/app.dart';
import 'package:soulbook/src/di/core_module.dart';
import 'package:soulbook/src/di/injector.dart';
import 'package:soulbook/src/di/module.dart';
import 'package:soulbook/src/di/ui_module.dart';

void main() => runApp(Injector(
      child: App(),
      modules: <Module>[
        CoreModule.create(),
        UiModule.create(),
      ],
    ));
