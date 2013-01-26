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
    animation = new Animation(sprite, 18, 0.05, loop:true);
  }

  /**
   * Wird benutzt um die Koordinaten des Helden zu aktualisieren.
   */
  void update() {
    //Kann gleichzeitig nach oben und links gehen aber nicht links und rechts
      if(left){
        if(sprite.id != "left"){
          sprite = game.assetManager.getAsset('img/left_sprite.gif');
          sprite.id = "left";
          animation = new Animation(sprite, 22, 0.05, loop:true);
        }
        x-=speed;
      }else if(right){
        if(sprite.id != "right"){
          sprite = game.assetManager.getAsset('img/right_sprite.gif');
          sprite.id = "right";
          animation = new Animation(sprite, 22, 0.05, loop:true);
        }
        x+=speed;
      }
      if(up){
        if(sprite.id != "up"){
          sprite = game.assetManager.getAsset('img/up_sprite.gif');
          sprite.id = "up";
          animation = new Animation(sprite, 22, 0.05, loop:true);
        }
        y-=speed;
      }else if(down){
        if(sprite.id != "down"){
          sprite = game.assetManager.getAsset('img/down_sprite.gif');
          sprite.id = "down";
          animation = new Animation(sprite, 22, 0.05, loop:true);
        }
        y+=speed;
      }
  }

  /**
   * Zeichnet den Helden
   */
  void draw(ctx) {
    ctx.save();
    ctx.translate(x, y);
    ctx.translate(-x, -y);
    animation.drawFrame(game.clockTick, ctx, x, y);
    ctx.restore();
    super.draw(ctx);
  }
  
  /**
   * Setzt den Sprite zur entsprechenden bewegen.
   * Je nachdem in welche Richtung sich man bewegt.
   */
  void changeDirectionOfEntity(int direction){
    //Links
    if(direction == 1){
      left = true;
      //Rechts
    }else if(direction == 2){
      right = true;
      //Hoch
    }else if(direction == 3){
      up = true;
      //Runter
    }else if(direction == 4){
      down = true;
    }else{

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
    if(!left && !right && !up && !down){
      sprite = game.assetManager.getAsset('img/normale_sprite.gif');
      sprite.id = "normale";
      animation = new Animation(sprite, 18, 0.05, loop:true);
    }
  }
}
