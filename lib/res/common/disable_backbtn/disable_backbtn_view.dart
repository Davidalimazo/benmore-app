import 'package:benmore/res/common/disable_backbtn/disable_back_btn_vmodel.dart';
import 'package:benmore/res/components/dialogs/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class DisableBackButton extends StatefulWidget {
  final Widget child;
  const DisableBackButton({Key? key, required this.child}) : super(key: key);

  @override
  State<DisableBackButton> createState() => _DisableBackButtonState();
}

class _DisableBackButtonState extends State<DisableBackButton> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisableBackBtnVmodel>.reactive(
        viewModelBuilder: () => DisableBackBtnVmodel(),
        builder: (context, viewModel, child) => WillPopScope(
              onWillPop: () async {
                final value = await showDialog<bool>(
                    context: context,
                    builder: (c) => LogoutConfirmationDialog(onLogout: () {
                          viewModel.clearData();
                          SystemNavigator.pop();
                        }));
                if (value != null) {
                  return Future.value(value);
                }
                return Future.value(false);
              },
              child: widget.child,
            ));
  }
}
