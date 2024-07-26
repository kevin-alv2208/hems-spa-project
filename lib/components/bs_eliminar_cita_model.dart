import '/flutter_flow/flutter_flow_util.dart';
import 'bs_eliminar_cita_widget.dart' show BsEliminarCitaWidget;
import 'package:flutter/material.dart';

class BsEliminarCitaModel extends FlutterFlowModel<BsEliminarCitaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for borrarTxt widget.
  FocusNode? borrarTxtFocusNode;
  TextEditingController? borrarTxtTextController;
  String? Function(BuildContext, String?)? borrarTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    borrarTxtFocusNode?.dispose();
    borrarTxtTextController?.dispose();
  }
}
