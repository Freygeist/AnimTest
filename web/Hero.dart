part of anim_test;

class Hero extends GameEntity {

  static final num speed = 2;
  Animation animation;
  bool left = false;
  bool right = false;
  bool up = false;
  bool down = false;

  /**
   * Konstruktor
   * Game, X, Y
   */
  Hero(Game game, num x, num y) : super.withPosition(game, x, y) {
    sprite = game.assetManager.getAsset('img/normale_sprite.gif');
    animation = new Animation(sprite, 22, 0.05, loop:true);
  }

  /**
   * Wird benutzt um die Koordinaten des Helden zu aktualisieren.
   */
  void update() {
    //Kann gleichzeitig nach oben und links gehen aber nicht links und rechts
      if(left){
        print(left);
        x-=speed;
      }else if(right){
        x+=speed;
      }
      if(up){
        y-=speed;
      }else if(down){
        y+=speed;
      }
  }

  /**
   * Zeichnet den Helden
   */
  void drawOutlines(ctx) {
    ctx.save();
    ctx.translate(x, y);
    ctx.translate(-x, -y);
    animation.drawFrame(game.clockTick, ctx, x, y);
    ctx.restore();
    super.drawOutlines(ctx);
  }
  
  /**
   * Setzt den Sprite zur entsprechenden bewegen.
   * Je nachdem in welche Richtung sich man bewegt.
   */
  void changeDirectionOfEntity(int direction){
    //Links
    print("change");
    if(direction == 1){
      sprite = game.assetManager.getAsset('img/left_sprite.gif');
      animation = new Animation(sprite, 22, 0.05, loop:true);
      left = true;
      //Rechts
    }else if(direction == 2){
      sprite = game.assetManager.getAsset('img/right_sprite.gif');
      animation = new Animation(sprite, 22, 0.05, loop:true);
      right = true;
      //Hoch
    }else if(direction == 3){
      sprite = game.assetManager.getAsset('img/up_sprite.gif');
      animation = new Animation(sprite, 22, 0.05, loop:true);
      up = true;
      //Runter
    }else if(direction == 4){
      sprite = game.assetManager.getAsset('img/down_sprite.gif');
      animation = new Animation(sprite, 22, 0.05, loop:true);
      down = true;
    }else{
      sprite = game.assetManager.getAsset('img/normale_sprite.gif');
      animation = new Animation(sprite, 22, 0.05, loop:true);
    }
  }
  
  /**
   * Wird aufgerufen, wenn eine Taste losgelassen wird.
   */
  void releaseKey(int direction){
    if(direction == 1){
      left = false;
    }else if(direction == 2){
      right = false;
    }else if(direction == 3){
      up = false;
    }else if(direction == 4){
      down = false;
    }
  }
}
