import '/flutter_flow/flutter_flow_util.dart';
import 'bs_editarperfil_widget.dart' show BsEditarperfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BsEditarperfilModel extends FlutterFlowModel<BsEditarperfilWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txt_nombre widget.
  FocusNode? txtNombreFocusNode1;
  TextEditingController? txtNombreTextController1;
  String? Function(BuildContext, String?)? txtNombreTextController1Validator;
  // State field(s) for txt_nombre widget.
  FocusNode? txtNombreFocusNode2;
  TextEditingController? txtNombreTextController2;
  String? Function(BuildContext, String?)? txtNombreTextController2Validator;
  // State field(s) for txt_telefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoTextController;
  final txtTelefonoMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtTelefonoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreFocusNode1?.dispose();
    txtNombreTextController1?.dispose();

    txtNombreFocusNode2?.dispose();
    txtNombreTextController2?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoTextController?.dispose();
  }
}
