import 'package:benmore/config/locator.dart';
import 'package:benmore/core/enums/dialog_type.dart';
import 'package:benmore/res/components/dialogs/loader_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialog() {
  final DialogService dialogService = locator<DialogService>();

  final builders = {
    DialogType.loader: (context, sheetRequest, completer) =>
        LoaderDialog(request: sheetRequest as DialogRequest),
    DialogType.success: (context, sheetRequest, completer) => Text("")
  };

  dialogService.registerCustomDialogBuilders(builders);
}
