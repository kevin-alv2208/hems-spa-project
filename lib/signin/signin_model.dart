import '/flutter_flow/flutter_flow_util.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yz43ua72' /* Este campo es requerido */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'gu6610tl' /* Debe ingresar al menos 8 carac... */,
      );
    }
    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        'tcacrek0' /* Superó el máximo de caracteres */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '9ixwczg5' /* El correo ingresado no es váli... */,
      );
    }
    return null;
  }

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  final telefonoMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '15srzje3' /* Este campo es requerido */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'aodcsapf' /* Debe ingresar al menos 8 carac... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'd3zzea7l' /* Superó el máximo de caracteres */,
      );
    }
    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{8,100}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2j26z4ma' /* La contraseña debe tener entre... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    correoFocusNode?.dispose();
    correoTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
