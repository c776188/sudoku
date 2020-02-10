class GameButton {
  final id;
  String text = "";
  bool enabled;

  GameButton({this.id, this.text = "", this.enabled = false});
}

class TTTButton {
  final id;
  String text = "";
  bool enabled;

  TTTButton({this.id, this.text = "", this.enabled = true});
}
