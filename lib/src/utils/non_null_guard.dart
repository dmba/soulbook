import 'package:flutter/material.dart';

typedef I18NResolutionCallback = LocaleResolutionCallback Function({
  Locale fallback,
});

LocaleResolutionCallback nonNullGuard({
  I18NResolutionCallback callback,
  Locale fallback,
}) {
  return (Locale locale, Iterable<Locale> supported) {
    if (locale == null) {
      return fallback;
    } else {
      return callback(fallback: fallback)(locale, supported);
    }
  };
}
