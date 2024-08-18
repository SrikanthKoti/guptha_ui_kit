import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:guptha_ui_kit/src/ui/atoms/gk_toast_widget.dart';
import 'package:guptha_ui_kit/src/ui/ui_imports.dart';

class GkOverlayManager {
  Widget? _widget;

  LoaderOverlayEntry? overlayEntry;
  Widget? get w => _widget;

  factory GkOverlayManager() => _instance;
  static final GkOverlayManager _instance = GkOverlayManager._internal();

  GkOverlayManager._internal();

  static GkOverlayManager get instance => _instance;

  static bool get onScreen => _instance.w != null;

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoaderOverlay(child: child));
      } else {
        return LoaderOverlay(child: child);
      }
    };
  }

  static Future<void> showToast({
    ToastType type = ToastType.error,
    String msg = "Something went wrong",
    ToastDuration duration = ToastDuration.medium,
    //msg will not be used when toastWidget is passed
    Widget? toastWidget,
  }) async {
    Widget w = Semantics(
      value: "showToast${type.name}",
      child: toastWidget ??
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 80),
            child: GkToastWidget(
              type: type,
              title: msg,
            ),
          ),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) => _instance._show(widget: w));
    _instance._show(widget: w);
    await Future.delayed(Duration(seconds: _toastEnumToDuration(duration)));
    hideOverlay();
  }

  static int _toastEnumToDuration(ToastDuration toastDuration) {
    switch (toastDuration) {
      case ToastDuration.short:
        return 2;
      case ToastDuration.medium:
        return 3;
      case ToastDuration.long:
        return 5;
    }
  }

  // Brute code remove later
  static showLoaderWText(
      {required double opacity, required Color color, String text = "Initializing"}) {
    Widget w = Material(
        elevation: 0.0,
        color: color.withOpacity(opacity),
        child: Container(
          alignment: Alignment.center,
          color: gkColors.white.withOpacity(opacity),
          child: Center(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    text,
                    style: gkInterStyles.titleThree,
                  ),
                ],
              ),
            ),
          ),
        ));

    SchedulerBinding.instance.addPostFrameCallback((_) => _instance._show(widget: w));

    _instance._show(widget: w);
  }

  ///Duration in milliseconds
  static showLoader(
      {required double opacity, Color color = const Color(0xFF7F3DFF), Widget? loaderWidget}) {
    Widget w = loaderWidget ??
        Material(
            elevation: 0.0,
            color: color.withOpacity(opacity),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: color.withOpacity(opacity),
                child: const CircularProgressIndicator(),
              ),
            ));

    SchedulerBinding.instance.addPostFrameCallback((_) => _instance._show(widget: w));

    _instance._show(widget: w);
  }

  static Future<void> hideOverlay() {
    return _instance._dismiss();
  }

  _show({Widget? widget}) async {
    _widget = widget;
    _markNeedsBuild();
  }

  Future<void> _dismiss() async {
    _widget = null;
    _markNeedsBuild();
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  static TransitionBuilder transitionBuilder({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(
          context,
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: LoaderOverlay(child: child),
          ),
        );
      } else {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: LoaderOverlay(child: child),
        );
      }
    };
  }
}

class LoaderOverlayEntry extends OverlayEntry {
  @override
  // ignore: overridden_fields
  final WidgetBuilder builder;

  LoaderOverlayEntry({
    required this.builder,
  }) : super(builder: builder);

  @override
  void markNeedsBuild() {
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {});
      super.markNeedsBuild();
    } else {
      super.markNeedsBuild();
    }
  }
}

class LoaderOverlay extends StatefulWidget {
  final Widget? child;

  const LoaderOverlay({
    super.key,
    required this.child,
  }) : assert(child != null);

  @override
  LoaderOverlayState createState() => LoaderOverlayState();
}

class LoaderOverlayState extends State<LoaderOverlay> {
  late LoaderOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = LoaderOverlayEntry(
      builder: (BuildContext context) => GkOverlayManager.instance.w ?? Container(),
    );
    GkOverlayManager.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          LoaderOverlayEntry(
            builder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
