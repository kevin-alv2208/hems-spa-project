import '/flutter_flow/flutter_flow_util.dart';
import 'incluir_servicio_widget.dart' show IncluirServicioWidget;
import 'package:flutter/material.dart';

class IncluirServicioModel extends FlutterFlowModel<IncluirServicioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTxt widget.
  FocusNode? nameTxtFocusNode;
  TextEditingController? nameTxtTextController;
  String? Function(BuildContext, String?)? nameTxtTextControllerValidator;
  // State field(s) for descripcionTxt widget.
  FocusNode? descripcionTxtFocusNode;
  TextEditingController? descripcionTxtTextController;
  String? Function(BuildContext, String?)?
      descripcionTxtTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameTxtFocusNode?.dispose();
    nameTxtTextController?.dispose();

    descripcionTxtFocusNode?.dispose();
    descripcionTxtTextController?.dispose();
  }
}
