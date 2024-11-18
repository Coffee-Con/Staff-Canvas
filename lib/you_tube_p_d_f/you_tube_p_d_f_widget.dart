import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'you_tube_p_d_f_model.dart';
export 'you_tube_p_d_f_model.dart';

class YouTubePDFWidget extends StatefulWidget {
  const YouTubePDFWidget({
    super.key,
    required this.materialID,
    int? materialType,
    required this.url,
  }) : this.materialType = materialType ?? 1;

  final int? materialID;
  final int materialType;
  final String? url;

  @override
  State<YouTubePDFWidget> createState() => _YouTubePDFWidgetState();
}

class _YouTubePDFWidgetState extends State<YouTubePDFWidget> {
  late YouTubePDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YouTubePDFModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: true,
            title: Text(
              FFLocalizations.of(context).getText(
                'uuosxsx6' /* YouTube & PDF Demo */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.materialType == 1)
                  FlutterFlowYoutubePlayer(
                    url: '${widget!.url}',
                    autoPlay: false,
                    looping: true,
                    mute: false,
                    showControls: true,
                    showFullScreen: true,
                    strictRelatedVideos: true,
                  ),
                if (widget!.materialType == 2)
                  FlutterFlowPdfViewer(
                    networkPath: widget!.url!,
                    height: 300.0,
                    horizontalScroll: false,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
