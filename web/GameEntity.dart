part of anim_test;

class GameEntity {
  num x;
  num y;
  bool removeFromWorld = false;
  var sprite;
  num radius;
  Game game;

  GameEntity(Game this.game);

  GameEntity.withPosition(Game this.game, num this.x, num this.y);

  /**
   * Muss von jeder Enitity überschrieben werden
   */
  void update() { }
  
  /**
   * Muss von jeder Enitity überschrieben werden
   */
  void changeDirectionOfEntity(int direction) { }
  
  /**
   * Muss von jeder Enitity überschrieben werden
   */
  void releaseKey(int direction) { }

  /**
   * Zeichnet einen grünen Bogen um die Enitity
   */
  void drawOutlines(ctx) {
    if (game.showOutlines) {
      ctx.beginPath();
      ctx.strokeStyle = "green";
      ctx.arc(x, y, radius, 0, Math.PI*2, false);
      ctx.stroke();
      ctx.closePath();
    }
  }

  /**
   * Zeichnet die Entity über dem Mittelpunkt und nicht links oben
   */
  void drawSpriteCentered(ctx) {
    var _x = x - sprite.width/2;
    var _y = y - sprite.height/2;
    ctx.drawImage(sprite, _x, _y);
  }

  /**
   * Prüft ob sich die Entity ausserhalb des Bildschirms befindet
   */
  bool outsideScreen() {
    return (x > game.canvasBreite || x < 0 ||
        y > game.canvasHoehe || y < 0);
  }
}