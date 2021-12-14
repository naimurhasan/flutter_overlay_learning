import 'package:flutter/material.dart';

class OverlayPicker extends StatefulWidget {
  final List<String> countries;
  const OverlayPicker({Key? key, required this.countries}) : super(key: key);

  @override
  _OverlayPickerState createState() => _OverlayPickerState();
}

class _OverlayPickerState extends State<OverlayPicker> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  String displayText = "Country";
  bool overlayDisplayed = false;
  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: InkWell(
        onTap: (){
          if(overlayDisplayed){
            hideOverlay();
          }else{
            showOverlay();
          }
        },
        child: AppContainer(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$displayText'),
            Icon(Icons.arrow_drop_down),
          ],
        )),
      ),
    );
  }

  void hideOverlay(){
    entry?.remove();
    entry = null;
    overlayDisplayed = false;
  }
  void showOverlay() {
    overlayDisplayed = true;
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // no need when using follower
    // final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (BuildContext context) =>
        Positioned(
          // no need when using follower
          // left: offset.dx,
          // top: offset.dy + size.height,
          width: size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(0, size.height),
            showWhenUnlinked: false,
            child: buildOverlay(),
          ))
    );

    overlay.insert(entry!);
  }

  buildOverlay() {
    return Material(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.countries.map((e) => InkWell(
            onTap: (){
              setState(() {
                hideOverlay();
                displayText = e;
              });
            },
            child: AppContainer(
              child: Text('$e'),
            ),
          )).toList(),
        ),
      ),
    );
  }
} // country picker widget end

/// APP CONTAINER WIDGET
class AppContainer extends StatelessWidget {

  final double? margin;
  final Widget child;
  const AppContainer({Key? key, this.margin, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.3),
          border: Border(bottom: BorderSide(color: Colors.black))
      ),
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(margin ?? 0.0),
      child: child,
    );
  }
}




