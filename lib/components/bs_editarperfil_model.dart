import '/flutter_flow/flutter_flow_util.dart';
import 'bs_editarperfil_widget.dart' show BsEditarperfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BsEditarperfilModel extends FlutterFlowModel<BsEditarperfilWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txt_nombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // State field(s) for txt_telefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoTextController;
  final txtTelefonoMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtTelefonoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoTextController?.dispose();
  }
}
