import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lkquyge6' /* Este campo es requerido */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'edme9msn' /* Debe ingresar al menos 8 carac... */,
      );
    }
    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        '312hppeu' /* Superó el máximo de caracteres */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'u5na23gl' /* El correo ingresado no es váli... */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jeiojkta' /* Este campo es requerido */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'rqdvr10g' /* Debe ingresar al menos 8 carac... */,
      );
    }
    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        '3951km9p' /* Superó el máximo de caracteres */,
      );
    }
    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{8,100}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '7yxtxveu' /* La contraseña debe tener entre... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
