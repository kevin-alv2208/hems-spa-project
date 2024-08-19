import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bs_idioma_model.dart';
export 'bs_idioma_model.dart';

class BsIdiomaWidget extends StatefulWidget {
  /// cambiar de idioma
  const BsIdiomaWidget({super.key});

  @override
  State<BsIdiomaWidget> createState() => _BsIdiomaWidgetState();
}

class _BsIdiomaWidgetState extends State<BsIdiomaWidget> {
  late BsIdiomaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BsIdiomaModel());

    _model.switchValue = FFAppState().idioma;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close_rounded,
                          color: Color(0xFF3C7962),
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mn2hk731' /* Idioma */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF3C7962),
                                    fontSize: FFAppState().Titulos.toDouble(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nv0gt6ao' /* Español */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF3C7962),
                          fontSize: FFAppState().textosM.toDouble(),
                          letterSpacing: 0.0,
                        ),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue!,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue);
                      if (newValue) {
                        setAppLanguage(context, 'en');
                        FFAppState().idioma = true;
                        setState(() {});
                        Navigator.pop(context);
                      } else {
                        setAppLanguage(context, 'es');
                        FFAppState().idioma = false;
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF3C7962),
                    inactiveTrackColor: const Color(0xFFE4ECEC),
                    inactiveThumbColor: const Color(0xFF3C7962),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'bsth8aca' /* Ingles */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF3C7962),
                          fontSize: FFAppState().textosM.toDouble(),
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
